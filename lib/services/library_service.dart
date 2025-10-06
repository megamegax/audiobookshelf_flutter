import 'dart:convert';
import 'dart:typed_data';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/detailed_library_item.dart';
import 'package:audiobookshelf_flutter/model/libraries/libraries_response.dart';
import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_items_response.dart';
import 'package:audiobookshelf_flutter/model/libraries/personalized_home.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/device_info.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/play_item_request_payload.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/playback_session.dart';
import 'package:audiobookshelf_flutter/model/libraries/series_item.dart';
import 'package:audiobookshelf_flutter/model/libraries/series_response.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/http_client_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/services/login_service.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final libraryServiceProvider = Provider<LibraryService>((ref) {
  return LibraryService(
    ref.watch(httpClientProvider),
    ref.watch(serverAddressProvider),
    LoginService(
      ref.watch(httpClientProvider),
      ref.watch(serverAddressProvider),
      ref.watch(loginStateProvider.notifier),
    ),
  );
});

class LibraryService {
  final http.Client httpClient;
  final String serverAddress;
  final LoginService loginService;

  LibraryService(this.httpClient, this.serverAddress, this.loginService);

  /// Make an authenticated HTTP request with automatic token refresh
  Future<http.Response> _makeAuthenticatedRequest(
    String method,
    String endpoint, {
    Map<String, String>? headers,
    String? body,
    UserModel? userModel,
  }) async {
    final requestHeaders = <String, String>{
      'Content-Type': 'application/json',
      ...?headers,
    };

    if (userModel != null) {
      requestHeaders['Authorization'] = 'Bearer ${userModel.token}';
    }

    final uri = Uri.parse('$serverAddress$endpoint');
    http.Response response;

    if (method.toUpperCase() == 'GET') {
      response = await httpClient.get(uri, headers: requestHeaders);
    } else if (method.toUpperCase() == 'POST') {
      response =
          await httpClient.post(uri, headers: requestHeaders, body: body);
    } else if (method.toUpperCase() == 'PATCH') {
      response =
          await httpClient.patch(uri, headers: requestHeaders, body: body);
    } else {
      throw UnsupportedError('HTTP method $method not supported');
    }

    // Handle 401 Unauthorized - try to refresh token
    if (response.statusCode == 401 && userModel != null) {
      final newToken = await loginService.refreshToken();
      if (newToken != null) {
        // Retry the request with the new token
        requestHeaders['Authorization'] = 'Bearer $newToken';

        if (method.toUpperCase() == 'GET') {
          response = await httpClient.get(uri, headers: requestHeaders);
        } else if (method.toUpperCase() == 'POST') {
          response =
              await httpClient.post(uri, headers: requestHeaders, body: body);
        } else if (method.toUpperCase() == 'PATCH') {
          response =
              await httpClient.patch(uri, headers: requestHeaders, body: body);
        }
      }
    }

    return response;
  }

  Future<List<Library>> fetchLibraries(UserModel userModel) async {
    final token = userModel.token;
    final fetchLibrariesResponse = await httpClient
        .get(Uri.parse('$serverAddress/api/libraries?token=$token'));

    final responseBody = jsonDecode(fetchLibrariesResponse.body);
    final List<Library> libraries =
        LibrariesResponse.fromJson(responseBody).libraries;

    return libraries;
  }

  Future<PlaybackSession> playBook(
      UserModel userModel, LibraryItemEntity libraryItem) async {
    final personalizedHomeSectionsResponse = await _makeAuthenticatedRequest(
        'POST', '/api/items/${libraryItem.itemId}/play',
        userModel: userModel,
        body: jsonEncode(PlayItemRequestPayload(
            itemId: libraryItem.itemId,
            mediaType: libraryItem.mediaType,
            mediaPlayer: "html5-mobile",
            forceDirectPlay: true,
            forceTranscode: false,
            deviceInfo: const DeviceInfo(
                clientVersion: "0.1",
                sdkVersion: 10,
                manufacturer: "Flutter",
                model: "Flutter App",
                deviceId: "flutter_device_1234"))));

    if (personalizedHomeSectionsResponse.statusCode != 200) {
      throw Exception(
          'Failed to start playback: ${personalizedHomeSectionsResponse.statusCode}');
    }

    PlaybackSession playbackSession = PlaybackSession.fromJson(
        jsonDecode(personalizedHomeSectionsResponse.body));
    return playbackSession;
  }

  Future<List<PersonalizedHome>> fetchPersonalizedHome(
      UserModel userModel, String libraryId) async {
    final token = userModel.token;
    final personalizedHomeSectionsResponse = await httpClient.get(Uri.parse(
        '$serverAddress/api/libraries/$libraryId/personalized?token=$token'));

    final List<dynamic> responseBody =
        jsonDecode(personalizedHomeSectionsResponse.body);
    final List<PersonalizedHome> personalizedHomeSections =
        responseBody.map((e) => PersonalizedHome.fromJson(e)).toList();

    return personalizedHomeSections;
  }

  Future<List<LibraryItem>> fetchLibraryItems(
      UserModel userModel, String libraryId) async {
    final token = userModel.token;
    final fetchLibraryItemsResponse = await httpClient.get(
        Uri.parse(
            '$serverAddress/api/libraries/$libraryId/items?expanded=1&include=progress,rssfeed,authors'),
        headers: {"Authorization": "Bearer $token"});
    final responseBody = jsonDecode(fetchLibraryItemsResponse.body);
    final LibraryItemsResponse librariesResponse =
        LibraryItemsResponse.fromJson(responseBody);
    return librariesResponse.results;
  }

  Future<DetailedLibraryItem> fetchDetailedLibraryItem(
      UserModel userModel, String libraryItemId) async {
    final token = userModel.token;
    final fetchLibraryItemsResponse = await httpClient.get(
        Uri.parse('$serverAddress/api/items/$libraryItemId?expanded=1'),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        });
    final responseBody = jsonDecode(fetchLibraryItemsResponse.body);
    final DetailedLibraryItem librariesResponse =
        DetailedLibraryItem.fromJson(responseBody);
    return librariesResponse;
  }

  Future<List<SeriesItem>> fetchSeries(
      UserModel userModel, String libraryId) async {
    final token = userModel.token;
    final fetchLibraryItemsResponse = await httpClient.get(
        Uri.parse(
            '$serverAddress/api/libraries/$libraryId/series?sort=name&desc=0&filter=all&limit=50&page=0&minified=1&include=rssfeed,numEpisodesIncomplete'),
        headers: {"Authorization": "Bearer $token"});
    final responseBody = jsonDecode(fetchLibraryItemsResponse.body);
    final SeriesResponse seriesResponse = SeriesResponse.fromJson(responseBody);
    return seriesResponse.results;
  }

  Future<Uint8List?> fetchCover(LibraryItem item, UserModel userModel) async {
    final token = userModel.token;

    final response = await httpClient.get(
        Uri.parse("$serverAddress/api/items/${item.id}/cover"),
        headers: {"Authorization": "Bearer $token"});

    final bytes = response.bodyBytes;

    return bytes;
  }

  Future<void> sendProgressSync(UserModel userModel, String sessionId,
      Map<String, dynamic> syncData) async {
    final response = await _makeAuthenticatedRequest(
      'POST',
      '/api/session/$sessionId/sync',
      userModel: userModel,
      body: jsonEncode(syncData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to sync progress: ${response.statusCode}');
    }
  }

  Future<void> updateMediaProgress(UserModel userModel, String libraryItemId,
      {required Map<String, dynamic> updatePayload}) async {
    final response = await _makeAuthenticatedRequest(
      'PATCH',
      '/api/me/progress/$libraryItemId',
      userModel: userModel,
      body: jsonEncode(updatePayload),
    );

    if (response.statusCode != 200) {
      print(response.body);
      throw Exception(
          'Failed to update media progress: ${response.statusCode}');
    }
  }
}
