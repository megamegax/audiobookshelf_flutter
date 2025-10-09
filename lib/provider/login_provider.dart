import 'package:audiobookshelf_flutter/services/login_service.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/model/login_state.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/http_client_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginServiceProvider = Provider<LoginService>((ref) {
  return LoginService(ref.watch(httpClientProvider),
      ref.watch(serverAddressProvider), ref.read(loginStateProvider.notifier));
});
final loginStateProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(const LoginState.initial());

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

final serverSettingsNotifierProvider =
    StateNotifierProvider<ServerSettingsNotifier, ServerSettings?>((ref) {
  return ServerSettingsNotifier();
});

class ServerSettingsNotifier extends StateNotifier<ServerSettings?> {
  ServerSettingsNotifier() : super(null);
  ServerSettings loadServerSettings() {
    //todo load server settings from database
    return state!;
  }

  void updateServerSettings(ServerSettings serverSettings) {
    //todo save server settings to database
    state = serverSettings;
  }
}

final userModelNotifierProvider =
    StateNotifierProvider<UserModelNotifier, UserModel?>((ref) {
  return UserModelNotifier(ref);
});

class UserModelNotifier extends StateNotifier<UserModel?> {
  final Ref _ref;

  UserModelNotifier(this._ref) : super(null);

  UserModel loadUserModel() {
    //todo load user model from database
    return state!;
  }

  void updateUserModel(UserModel userModel) async {
    //todo save user model to database
    state = userModel;

    // Save media progress to local database
    if (userModel.mediaProgress != null &&
        userModel.mediaProgress!.isNotEmpty) {
      try {
        final repository =
            await _ref.read(libraryItemsRepositoryProvider.future);
        await repository.saveMediaProgresses(userModel);
      } catch (e) {
        // Log error but don't fail the login process
        print('[USER_MODEL] Error saving media progress: $e');
      }
    }
  }
}
