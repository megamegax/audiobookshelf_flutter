import 'dart:convert';
import 'package:audiobookshelf_flutter/services/login_service.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/model/login_state.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/http_client_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_provider.g.dart';

@riverpod
Future<LoginService> loginService(Ref ref) async {
  final serverAddress = await ref.watch(serverAddressLoaderProvider.future);
  return LoginService(
    ref.watch(httpClientProvider),
    serverAddress,
    ref.read(loginStateProvider.notifier),
  );
}

@riverpod
class LoginStateNotifier extends _$LoginStateNotifier {
  @override
  LoginState build() => LoginState.initial();

  void updateState(LoginState loginState) {
    state = loginState;
  }

  /// Refresh token method - placeholder for now
  Future<String?> refreshToken() async {
    // This would typically implement token refresh logic
    // For now, return null as we don't have the full implementation
    return null;
  }
}

@riverpod
class ServerSettingsNotifier extends _$ServerSettingsNotifier {
  @override
  ServerSettings? build() => null;

  ServerSettings loadServerSettings() {
    //todo load server settings from database
    return state!;
  }

  void updateServerSettings(ServerSettings serverSettings) {
    //todo save server settings to database
    state = serverSettings;
  }
}

@riverpod
class UserModelNotifier extends _$UserModelNotifier {
  @override
  UserModel? build() {
    if (kDebugMode) {
      print(
        '[USER_MODEL] UserModelNotifier build() called, loading from storage...',
      );
    }
    // Load user model from storage asynchronously
    _loadUserModelFromStorage();
    return null;
  }

  /// Load user model from SharedPreferences
  Future<void> _loadUserModelFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user_model');

      if (userJson != null) {
        if (kDebugMode) {
          print('[USER_MODEL] Found user model in storage, loading...');
        }
        final userMap = jsonDecode(userJson);
        final userModel = UserModel.fromJson(userMap);
        state = userModel;
        if (kDebugMode) {
          print(
            '[USER_MODEL] User model loaded from storage: ${userModel.username}',
          );
        }
      } else {
        if (kDebugMode) {
          print('[USER_MODEL] No user model found in storage');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[USER_MODEL] Error loading user model from storage: $e');
      }
      // Clear corrupted data
      await clearUserModel();
    }
  }

  /// Save user model to SharedPreferences
  Future<void> _saveUserModelToStorage(UserModel userModel) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = jsonEncode(userModel.toJson());
      await prefs.setString('user_model', userJson);
      if (kDebugMode) {
        print(
          '[USER_MODEL] User model saved to storage: ${userModel.username}',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('[USER_MODEL] Error saving user model to storage: $e');
      }
    }
  }

  /// Clear user model from SharedPreferences
  Future<void> clearUserModel() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_model');
      state = null;
      if (kDebugMode) {
        print('[USER_MODEL] User model cleared from storage');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[USER_MODEL] Error clearing user model from storage: $e');
      }
    }
  }

  UserModel loadUserModel() {
    //todo load user model from database
    return state!;
  }

  Future<void> updateUserModel(UserModel userModel) async {
    if (kDebugMode) {
      print('[USER_MODEL] Updating user model: ${userModel.username}');
    }
    // Set the state immediately
    state = userModel;
    if (kDebugMode) {
      print('[USER_MODEL] User model state updated: ${state?.username}');
    }

    // Save to persistent storage
    await _saveUserModelToStorage(userModel);

    // Save media progress to local database
    if (userModel.mediaProgress != null &&
        userModel.mediaProgress!.isNotEmpty) {
      try {
        final repository = await ref.read(
          libraryItemsRepositoryProvider.future,
        );
        await repository.saveMediaProgresses(userModel);
      } catch (e) {
        // Log error but don't fail the login process
        print('[USER_MODEL] Error saving media progress: $e');
      }
    }
  }
}
