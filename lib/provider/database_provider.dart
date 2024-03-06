import 'package:audiobookshelf_flutter/database/library_entity.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

final databaseProvider = FutureProvider<Isar>((ref) async {
  final directory = await getApplicationDocumentsDirectory();
  return await Isar.open([
    LibraryItemEntitySchema,
    LibraryEntitySchema,
  ], directory: directory.path);
});
