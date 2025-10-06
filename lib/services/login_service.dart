import 'dart:convert';

import 'package:audiobookshelf_flutter/model/login/login_response.dart';
import 'package:audiobookshelf_flutter/model/login/response.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final http.Client httpClient;
  final String serverAddress;
  final LoginStateNotifier loginStateNotifier;

  LoginService(this.httpClient, this.serverAddress, this.loginStateNotifier);

  Future<Response<LoginResponse?>> login(
      String username, String password) async {
    if (kDebugMode) {
      print('[LOGIN_SERVICE] Login metódus hívva');
      print('[LOGIN_SERVICE] Username: $username');
      print('[LOGIN_SERVICE] Password length: ${password.length}');
      print('[LOGIN_SERVICE] Server address: $serverAddress');
    }

    if (username.isEmpty || password.isEmpty) {
      if (kDebugMode) {
        print('[LOGIN_SERVICE] Username vagy password üres');
      }
      return Response(
          data: null,
          message: "Felhasználónév és jelszó nem lehet üres",
          success: false,
          statusCode: 400);
    }

    try {
      final loginUrl = '$serverAddress/login';
      if (kDebugMode) {
        print('[LOGIN_SERVICE] Login URL: $loginUrl');
        print('[LOGIN_SERVICE] HTTP POST kérés küldése...');
      }

      final response = await httpClient.post(
        Uri.parse(loginUrl),
        headers: {
          'Content-Type': 'application/json',
          'x-return-tokens':
              'true', // Tells the Abs server to return the refresh token
        },
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
      );

      if (kDebugMode) {
        print('[LOGIN_SERVICE] HTTP válasz érkezett');
        print('[LOGIN_SERVICE] Status code: ${response.statusCode}');
        print('[LOGIN_SERVICE] Response body length: ${response.body.length}');
        print('[LOGIN_SERVICE] Response body: ${response.body}');
      }

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('[LOGIN_SERVICE] Sikeres HTTP válasz (200)');
        }

        final responseBody = jsonDecode(response.body);
        if (kDebugMode) {
          print('[LOGIN_SERVICE] JSON dekódolás sikeres');
        }

        final loginResponse = LoginResponse.fromJson(responseBody);
        if (kDebugMode) {
          print('[LOGIN_SERVICE] LoginResponse objektum létrehozva');
          print('[LOGIN_SERVICE] User ID: ${loginResponse.user.id}');
          print(
              '[LOGIN_SERVICE] User username: ${loginResponse.user.username}');
        }

        // Save refresh token to secure storage
        if (loginResponse.user.refreshToken != null) {
          if (kDebugMode) {
            print('[LOGIN_SERVICE] Refresh token mentése...');
          }
          await _saveRefreshToken(loginResponse.user.refreshToken!);
          if (kDebugMode) {
            print('[LOGIN_SERVICE] Refresh token mentve');
          }
        }

        if (kDebugMode) {
          print('[LOGIN_SERVICE] Sikeres bejelentkezés válasz küldése');
        }
        return Response(
            data: loginResponse,
            message: "Sikeres bejelentkezés",
            success: true,
            statusCode: response.statusCode);
      } else {
        if (kDebugMode) {
          print('[LOGIN_SERVICE] HTTP hiba: ${response.statusCode}');
        }
        final errorMessage = response.body.isNotEmpty
            ? response.body
            : 'Bejelentkezés sikertelen (${response.statusCode})';
        return Response(
            data: null,
            message: errorMessage,
            success: false,
            statusCode: response.statusCode);
      }
    } catch (e) {
      if (kDebugMode) {
        print('[LOGIN_SERVICE] Exception történt: ${e.toString()}');
        print('[LOGIN_SERVICE] Exception type: ${e.runtimeType}');
      }
      return Response(
          data: null,
          message: 'Hálózati hiba: ${e.toString()}',
          success: false,
          statusCode: 500);
    }
  }

  /// Refresh the access token using the refresh token
  Future<String?> refreshToken() async {
    try {
      final refreshToken = await _getRefreshToken();
      if (refreshToken == null) {
        return null;
      }

      final response = await httpClient.post(
        Uri.parse('$serverAddress/auth/refresh'),
        headers: {
          'Content-Type': 'application/json',
          'x-refresh-token': refreshToken,
        },
        body: jsonEncode({}),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final user = responseBody['user'];

        if (user != null && user['accessToken'] != null) {
          // Save new refresh token if provided
          if (user['refreshToken'] != null) {
            await _saveRefreshToken(user['refreshToken']);
          }

          return user['accessToken'];
        }
      }

      return null;
    } catch (e) {
      print('Token refresh failed: $e');
      return null;
    }
  }

  /// Save refresh token to secure storage
  Future<void> _saveRefreshToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('refresh_token', refreshToken);
  }

  /// Get refresh token from secure storage
  Future<String?> _getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('refresh_token');
  }

  /// Clear refresh token from secure storage
  Future<void> clearRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('refresh_token');
  }
}
