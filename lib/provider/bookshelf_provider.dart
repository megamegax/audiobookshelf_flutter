import 'dart:typed_data';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/database/media_progress_entity.dart';
import 'package:audiobookshelf_flutter/provider/database_provider.dart';
import 'package:audiobookshelf_flutter/provider/http_client_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

Future<LibraryItemEntity?> fetchLibraryItem(
    WidgetRef ref, String itemId) async {
  final Isar isar = await ref.watch(databaseProvider.future);
  final LibraryItemEntity? item = await isar.libraryItemEntitys
      .where()
      .filter()
      .itemIdEqualTo(itemId)
      .findFirst();

  return item;
}

Future<Uint8List?> fetchCover(WidgetRef ref, String itemId) async {
  final Isar isar = await ref.watch(databaseProvider.future);
  final serverAddress = ref.watch(serverAddressProvider);
  final userModel = ref.watch(userModelNotifierProvider);
  final httpClient = ref.read(httpClientProvider);
  final LibraryItemEntity? item = await isar.libraryItemEntitys
      .where()
      .filter()
      .itemIdEqualTo(itemId)
      .findFirst();

  if (item!.mediaProgress?.coverBytes == null) {
    final url = Uri.parse(
        "$serverAddress/api/items/$itemId/cover?token=${userModel?.token}");

    final response = await httpClient.get(url);
    final bytes = response.bodyBytes;
    item.mediaProgress = MediaProgressEntity(coverBytes: bytes);
    isar.writeTxn(() => isar.libraryItemEntitys.put(item));

    return bytes;
  } else {
    return item.mediaProgress?.coverBytes == null
        ? null
        : Uint8List.fromList(item.mediaProgress!.coverBytes!);
  }
}
