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
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final libraryServiceProvider = Provider<LibraryService>((ref) {
  return LibraryService(
      ref.watch(httpClientProvider), ref.watch(serverAddressProvider));
});

class LibraryService {
  final http.Client httpClient;
  final String serverAddress;

  LibraryService(this.httpClient, this.serverAddress);

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
    final token = userModel.token;
    final personalizedHomeSectionsResponse = await httpClient.post(
        Uri.parse(
            '$serverAddress/api/items/${libraryItem.itemId}/play?token=$token'),
        body: jsonEncode(PlayItemRequestPayload(
            itemId: libraryItem.itemId,
            mediaType: libraryItem.mediaType,
            mediaPlayer: "web",
            forceDirectPlay: false,
            forceTranscode: true,
            deviceInfo: const DeviceInfo(
                clientVersion: "0.1",
                sdkVersion: 10,
                manufacturer: "11",
                model: "Pixel 4a",
                deviceId: "1234"))));
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
    final token = userModel.token;

    final response = await httpClient.post(
      Uri.parse('$serverAddress/api/session/$sessionId/sync'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(syncData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to sync progress');
    }
  }

  Future<void> updateMediaProgress(UserModel userModel, String libraryItemId,
      {required Map<String, dynamic> updatePayload}) async {
    final token = userModel.token;

    final response = await httpClient.patch(
      Uri.parse('$serverAddress/api/me/progress/$libraryItemId'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(updatePayload),
    );

    if (response.statusCode != 200) {
      print(response.body);
      throw Exception('Failed to update media progress');
    }
  }
}
