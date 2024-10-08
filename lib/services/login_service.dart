import 'dart:convert';

import 'package:audiobookshelf_flutter/model/login/login_response.dart';
import 'package:audiobookshelf_flutter/model/login/response.dart';
import 'package:audiobookshelf_flutter/model/login_state.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:http/http.dart' as http;

class LoginService {
  final http.Client httpClient;
  final String serverAddress;
  final LoginStateNotifier loginStateNotifier;

  LoginService(this.httpClient, this.serverAddress, this.loginStateNotifier);

  Future<Response<LoginResponse?>> login(
      String username, String password) async {
    LoginState loginState;
    if (username.isEmpty || password.isEmpty) {
      loginState =
          const LoginState.error('Username and password must not be empty');
    }

    try {
      final response = await httpClient.post(
        Uri.parse('$serverAddress/login'),
        body: {
          "username": username,
          "password": password,
        },
      );
      final responseBody = jsonDecode(response.body);
      final loginResponse = LoginResponse.fromJson(responseBody);
      loginState = LoginState.success(loginResponse);
      return Response(
          data: loginResponse,
          message: response.body,
          success: response.statusCode == 200,
          statusCode: response.statusCode);
    } catch (e) {
      loginState = LoginState.error(e.toString());
    }
    loginStateNotifier.updateState(loginState);
    return Response(
        data: null, message: "unknown error", success: false, statusCode: 500);
  }
}
