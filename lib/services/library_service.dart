import 'dart:convert';

import 'package:audiobookshelf_flutter/model/libraries/libraries_response.dart';
import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_items_response.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/http_client_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
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
}
