import 'dart:convert';
import 'dart:typed_data';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/detailed_library_item.dart';
import 'package:audiobookshelf_flutter/model/libraries/libraries_response.dart';
import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item_new.dart';
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
    if (kDebugMode) {
      print(
          '[LIBRARY_SERVICE] Starting playback for item: ${libraryItem.itemId}');
      print('[LIBRARY_SERVICE] Media type: ${libraryItem.mediaType}');
      print('[LIBRARY_SERVICE] Title: ${libraryItem.media.metadata?.title}');
    }

    final personalizedHomeSectionsResponse = await _makeAuthenticatedRequest(
        'POST', '/api/items/${libraryItem.itemId}/play',
        userModel: userModel,
        body: jsonEncode(PlayItemRequestPayload(
            itemId: libraryItem.itemId,
            mediaType: libraryItem.mediaType,
            mediaPlayer: "html5-mobile",
            forceDirectPlay: true, // Allow direct play like the original app
            forceTranscode: false, // Don't force transcoding, let server decide
            deviceInfo: const DeviceInfo(
                clientVersion: "0.1",
                sdkVersion: 10,
                manufacturer: "Flutter",
                model: "Flutter App",
                deviceId: "flutter_device_1234"))));

    if (personalizedHomeSectionsResponse.statusCode != 200) {
      if (kDebugMode) {
        print(
            '[LIBRARY_SERVICE] Playback request failed with status: ${personalizedHomeSectionsResponse.statusCode}');
        print(
            '[LIBRARY_SERVICE] Response body: ${personalizedHomeSectionsResponse.body}');
      }
      throw Exception(
          'Failed to start playback: ${personalizedHomeSectionsResponse.statusCode}');
    }

    final responseBody = jsonDecode(personalizedHomeSectionsResponse.body);
    if (kDebugMode) {
      print('[LIBRARY_SERVICE] Playback session response: $responseBody');
    }

    PlaybackSession playbackSession = PlaybackSession.fromJson(responseBody);
    if (kDebugMode) {
      print(
          '[LIBRARY_SERVICE] Created playback session: ${playbackSession.id}');
      print(
          '[LIBRARY_SERVICE] Audio tracks count: ${playbackSession.audioTracks.length}');
      for (int i = 0; i < playbackSession.audioTracks.length && i < 3; i++) {
        final track = playbackSession.audioTracks[i];
        print(
            '[LIBRARY_SERVICE] Track $i: index=${track.index}, contentUrl=${track.contentUrl}, duration=${track.duration}');
      }
    }

    return playbackSession;
  }

  Future<List<PersonalizedHome>> fetchPersonalizedHome(
      UserModel userModel, String libraryId) async {
    final token = userModel.token;
    final personalizedHomeSectionsResponse = await httpClient.get(Uri.parse(
        '$serverAddress/api/libraries/$libraryId/personalized?token=$token'));

    final List<dynamic> responseBody =
        jsonDecode(personalizedHomeSectionsResponse.body);
    // Temporarily commented out due to build issues with PersonalizedHome.fromJson
    // final List<PersonalizedHome> personalizedHomeSections =
    //     responseBody.map((e) => PersonalizedHome.fromJson(e)).toList();
    final List<PersonalizedHome> personalizedHomeSections = [];

    return personalizedHomeSections;
  }

  Future<List<LibraryItemNew>> fetchLibraryItems(
      UserModel userModel, String libraryId) async {
    final token = userModel.token;
    if (kDebugMode) {
      print('[LIBRARY_SERVICE] Fetching library items for library: $libraryId');
    }

    final fetchLibraryItemsResponse = await httpClient.get(
        Uri.parse(
            '$serverAddress/api/libraries/$libraryId/items?expanded=1&include=progress,rssfeed,authors'),
        headers: {"Authorization": "Bearer $token"});

    if (kDebugMode) {
      print(
          '[LIBRARY_SERVICE] HTTP response status: ${fetchLibraryItemsResponse.statusCode}');
      print(
          '[LIBRARY_SERVICE] Response body length: ${fetchLibraryItemsResponse.body.length}');
    }

    final responseBody = jsonDecode(fetchLibraryItemsResponse.body);

    if (kDebugMode) {
      print('[LIBRARY_SERVICE] JSON decoded successfully');

      // Log the complete response structure
      print('[LIBRARY_SERVICE] === COMPLETE RESPONSE STRUCTURE ===');
      print('[LIBRARY_SERVICE] Response keys: ${responseBody.keys.toList()}');
      responseBody.forEach((key, value) {
        if (key != 'results') {
          print('[LIBRARY_SERVICE] $key: $value (${value.runtimeType})');
        }
      });
      print('[LIBRARY_SERVICE] =====================================');

      if (responseBody is Map && responseBody.containsKey('results')) {
        final results = responseBody['results'] as List;
        print('[LIBRARY_SERVICE] Found ${results.length} items in response');
        if (results.isNotEmpty) {
          final firstItem = results.first;
          print('[LIBRARY_SERVICE] === FIRST ITEM COMPLETE STRUCTURE ===');
          print(
              '[LIBRARY_SERVICE] First item raw JSON keys: ${firstItem.keys.toList()}');

          // Log ALL fields in the first item
          firstItem.forEach((key, value) {
            if (key != 'media') {
              // We'll handle media separately
              print('[LIBRARY_SERVICE] $key: $value (${value.runtimeType})');
            }
          });

          print('[LIBRARY_SERVICE] =======================================');

          // Debug the media object specifically
          if (firstItem['media'] != null) {
            final media = firstItem['media'] as Map<String, dynamic>;
            print('[LIBRARY_SERVICE] === MEDIA OBJECT COMPLETE STRUCTURE ===');
            print(
                '[LIBRARY_SERVICE] Media object keys: ${media.keys.toList()}');

            // Log ALL fields in the media object
            media.forEach((key, value) {
              if (key != 'metadata') {
                // We'll handle metadata separately
                print(
                    '[LIBRARY_SERVICE] media.$key: $value (${value.runtimeType})');
              }
            });

            print(
                '[LIBRARY_SERVICE] ==========================================');

            // Debug metadata object
            if (media['metadata'] != null) {
              final metadata = media['metadata'] as Map<String, dynamic>;
              print(
                  '[LIBRARY_SERVICE] === METADATA OBJECT COMPLETE STRUCTURE ===');
              print(
                  '[LIBRARY_SERVICE] Metadata object keys: ${metadata.keys.toList()}');

              // Log ALL fields in the metadata object
              metadata.forEach((key, value) {
                print(
                    '[LIBRARY_SERVICE] metadata.$key: $value (${value.runtimeType})');
              });

              print(
                  '[LIBRARY_SERVICE] ==============================================');
            }
          }
        }
      }
    }

    // Try to deserialize each item individually to find the problematic one
    if (kDebugMode) {
      print(
          '[LIBRARY_SERVICE] Attempting to deserialize items individually...');
      final results = responseBody['results'] as List;
      for (int i = 0; i < results.length; i++) {
        try {
          final item = results[i];
          print(
              '[LIBRARY_SERVICE] Testing item $i: ${item['id']} - ${item['media']?['metadata']?['title']}');

          // Try to create a LibraryItemNew from this specific item
          LibraryItemNew.fromJson(item);
          print('[LIBRARY_SERVICE] Item $i deserialized successfully');
        } catch (e) {
          print('[LIBRARY_SERVICE] ERROR in item $i: $e');
          print('[LIBRARY_SERVICE] Problematic item data: ${results[i]}');
          rethrow; // Re-throw to see the full stack trace
        }
      }
    }

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
    if (kDebugMode) {
      print('[LIBRARY_SERVICE] Fetching series for library: $libraryId');
    }

    final fetchLibraryItemsResponse = await httpClient.get(
        Uri.parse(
            '$serverAddress/api/libraries/$libraryId/series?sort=name&desc=0&filter=all&limit=50&page=0&minified=1&include=rssfeed,numEpisodesIncomplete'),
        headers: {"Authorization": "Bearer $token"});

    if (kDebugMode) {
      print(
          '[LIBRARY_SERVICE] Series HTTP response status: ${fetchLibraryItemsResponse.statusCode}');
      print(
          '[LIBRARY_SERVICE] Series response body length: ${fetchLibraryItemsResponse.body.length}');
    }

    final responseBody = jsonDecode(fetchLibraryItemsResponse.body);

    if (kDebugMode) {
      print('[LIBRARY_SERVICE] Series JSON decoded successfully');
      if (responseBody is Map && responseBody.containsKey('results')) {
        final results = responseBody['results'] as List;
        print('[LIBRARY_SERVICE] Found ${results.length} series in response');
        if (results.isNotEmpty) {
          final firstSeries = results.first;
          print(
              '[LIBRARY_SERVICE] First series raw JSON keys: ${firstSeries.keys.toList()}');
        }
      }
    }

    final SeriesResponse seriesResponse = SeriesResponse.fromJson(responseBody);
    return seriesResponse.results;
  }

  Future<Uint8List?> fetchCover(
      LibraryItemNew item, UserModel userModel) async {
    final token = userModel.token;

    final response = await httpClient.get(
        Uri.parse("$serverAddress/api/items/${item.id}/cover"),
        headers: {"Authorization": "Bearer $token"});

    final bytes = response.bodyBytes;

    return bytes;
  }

  Future<List<Map<String, dynamic>>> fetchAuthors(
      UserModel userModel, String libraryId) async {
    final token = userModel.token;
    if (kDebugMode) {
      print('[LIBRARY_SERVICE] Fetching authors for library: $libraryId');
    }

    final response = await httpClient.get(
        Uri.parse("$serverAddress/api/libraries/$libraryId/authors"),
        headers: {"Authorization": "Bearer $token"});

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch authors: ${response.statusCode}');
    }

    final responseBody = jsonDecode(response.body);
    if (kDebugMode) {
      print(
          '[LIBRARY_SERVICE] Authors response body length: ${response.body.length}');
      print(
          '[LIBRARY_SERVICE] Authors response structure: ${responseBody.runtimeType}');
      print(
          '[LIBRARY_SERVICE] Authors response keys: ${responseBody is Map ? responseBody.keys.toList() : 'Not a map'}');
    }

    // Handle the response structure: { authors: [...] } or direct array
    List<Map<String, dynamic>> authors;
    if (responseBody is Map && responseBody.containsKey('authors')) {
      authors = List<Map<String, dynamic>>.from(responseBody['authors']);
    } else if (responseBody is List) {
      authors = List<Map<String, dynamic>>.from(responseBody);
    } else {
      if (kDebugMode) {
        print(
            '[LIBRARY_SERVICE] Unexpected authors response structure: $responseBody');
      }
      authors = [];
    }

    if (kDebugMode) {
      print('[LIBRARY_SERVICE] Found ${authors.length} authors in response');
    }

    return authors;
  }

  Future<List<Map<String, dynamic>>> fetchNarrators(
      UserModel userModel, String libraryId) async {
    final token = userModel.token;
    if (kDebugMode) {
      print('[LIBRARY_SERVICE] Fetching narrators for library: $libraryId');
    }

    final response = await httpClient.get(
        Uri.parse("$serverAddress/api/libraries/$libraryId/narrators"),
        headers: {"Authorization": "Bearer $token"});

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch narrators: ${response.statusCode}');
    }

    final responseBody = jsonDecode(response.body);
    if (kDebugMode) {
      print(
          '[LIBRARY_SERVICE] Narrators response body length: ${response.body.length}');
      print(
          '[LIBRARY_SERVICE] Narrators response structure: ${responseBody.runtimeType}');
      print(
          '[LIBRARY_SERVICE] Narrators response keys: ${responseBody is Map ? responseBody.keys.toList() : 'Not a map'}');
    }

    // Handle the response structure: { narrators: [...] } or direct array
    List<Map<String, dynamic>> narrators;
    if (responseBody is Map && responseBody.containsKey('narrators')) {
      narrators = List<Map<String, dynamic>>.from(responseBody['narrators']);
    } else if (responseBody is List) {
      narrators = List<Map<String, dynamic>>.from(responseBody);
    } else {
      if (kDebugMode) {
        print(
            '[LIBRARY_SERVICE] Unexpected narrators response structure: $responseBody');
      }
      narrators = [];
    }

    if (kDebugMode) {
      print(
          '[LIBRARY_SERVICE] Found ${narrators.length} narrators in response');
    }

    return narrators;
  }

  Future<Uint8List?> fetchAuthorImage(
      String authorId, UserModel userModel) async {
    final token = userModel.token;

    if (kDebugMode) {
      print('[LIBRARY_SERVICE] Fetching author image for: $authorId');
    }

    final response = await httpClient.get(
        Uri.parse("$serverAddress/api/authors/$authorId/image?raw=true"),
        headers: {"Authorization": "Bearer $token"});

    if (kDebugMode) {
      print(
          '[LIBRARY_SERVICE] Author image response status: ${response.statusCode}');
    }

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(
            '[LIBRARY_SERVICE] Successfully fetched author image for: $authorId');
      }
      return response.bodyBytes;
    } else if (response.statusCode == 404) {
      if (kDebugMode) {
        print('[LIBRARY_SERVICE] No image found for author: $authorId');
      }
    } else {
      if (kDebugMode) {
        print(
            '[LIBRARY_SERVICE] Failed to fetch author image for: $authorId, status: ${response.statusCode}');
      }
    }
    return null;
  }

  Future<Uint8List?> fetchNarratorImage(
      String narratorId, UserModel userModel) async {
    final token = userModel.token;

    final response = await httpClient.get(
        Uri.parse("$serverAddress/api/narrators/$narratorId/image"),
        headers: {"Authorization": "Bearer $token"});

    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    return null;
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
