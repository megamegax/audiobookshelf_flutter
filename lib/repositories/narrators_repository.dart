import 'package:audiobookshelf_flutter/database/narrator_entity.dart';
import 'package:audiobookshelf_flutter/provider/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';

class NarratorsRepository {
  final Isar _isar;

  NarratorsRepository(this._isar);

  Future<void> saveNarrator(NarratorEntity narrator) async {
    await _isar.writeTxn(() async {
      await _isar.narratorEntitys.put(narrator);
    });
  }

  Future<void> saveNarrators(List<NarratorEntity> narrators) async {
    await _isar.writeTxn(() async {
      for (final narrator in narrators) {
        // Check if narrator already exists
        final existingNarrator = await _isar.narratorEntitys
            .filter()
            .narratorIdEqualTo(narrator.narratorId)
            .findFirst();
        
        if (existingNarrator != null) {
          // Update existing narrator with new data
          existingNarrator.name = narrator.name;
          existingNarrator.nameIgnorePrefix = narrator.nameIgnorePrefix;
          existingNarrator.description = narrator.description;
          existingNarrator.imagePath = narrator.imagePath;
          existingNarrator.addedAt = narrator.addedAt;
          existingNarrator.updatedAt = narrator.updatedAt;
          existingNarrator.bookCount = narrator.bookCount;
          existingNarrator.seriesCount = narrator.seriesCount;
          // Keep existing imageBytes if new one is null/empty
          if (narrator.imageBytes != null && narrator.imageBytes!.isNotEmpty) {
            existingNarrator.imageBytes = narrator.imageBytes;
          }
          await _isar.narratorEntitys.put(existingNarrator);
        } else {
          // Insert new narrator
          await _isar.narratorEntitys.put(narrator);
        }
      }
    });
  }

  Future<List<NarratorEntity>> getAllNarrators() async {
    return await _isar.narratorEntitys.where().findAll();
  }

  Future<NarratorEntity?> getNarratorById(String narratorId) async {
    return await _isar.narratorEntitys
        .filter()
        .narratorIdEqualTo(narratorId)
        .findFirst();
  }

  Future<List<NarratorEntity>> getNarratorsByLibraryId(String libraryId) async {
    // For now, we'll get all narrators since the API doesn't filter by library
    // In the future, we might need to add a libraryId field to NarratorEntity
    return await _isar.narratorEntitys.where().findAll();
  }

  Future<void> saveNarratorImage(
      String narratorId, List<int> imageBytes) async {
    await _isar.writeTxn(() async {
      final narrator = await _isar.narratorEntitys
          .filter()
          .narratorIdEqualTo(narratorId)
          .findFirst();
      if (narrator != null) {
        narrator.imageBytes = imageBytes;
        await _isar.narratorEntitys.put(narrator);
      }
    });
  }

  Future<void> deleteNarrator(String narratorId) async {
    await _isar.writeTxn(() async {
      await _isar.narratorEntitys
          .filter()
          .narratorIdEqualTo(narratorId)
          .deleteFirst();
    });
  }

  Future<void> clearAllNarrators() async {
    await _isar.writeTxn(() async {
      await _isar.narratorEntitys.clear();
    });
  }
}

final narratorsRepositoryProvider =
    FutureProvider<NarratorsRepository>((ref) async {
  return NarratorsRepository(await ref.watch(databaseProvider.future));
});
