import 'package:audiobookshelf_flutter/services/login_service.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/model/login_state.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/http_client_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
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
}

final serverSettingsNotifierProvider =
    StateNotifierProvider<ServerSettingsNotifier, ServerSettings?>((ref) {
  return ServerSettingsNotifier(ref);
});

class ServerSettingsNotifier extends StateNotifier<ServerSettings?> {
  final Ref ref;

  ServerSettingsNotifier(this.ref) : super(null);
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
  final Ref ref;

  UserModelNotifier(this.ref) : super(null);
  UserModel loadUserModel() {
    //todo load user model from database
    return state!;
  }

  void updateUserModel(UserModel userModel) async {
    //todo save user model to database
    state = userModel;
  }
}
