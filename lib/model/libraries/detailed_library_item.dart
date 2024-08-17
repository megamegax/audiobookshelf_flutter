import 'package:audiobookshelf_flutter/model/libraries/collapsed_series.dart';
import 'package:audiobookshelf_flutter/model/libraries/detailed_media.dart';
import 'package:audiobookshelf_flutter/model/libraries/media.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/library_file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailed_library_item.freezed.dart';
part 'detailed_library_item.g.dart';

@freezed
class DetailedLibraryItem with _$DetailedLibraryItem {
  const factory DetailedLibraryItem({
    required String id,
    required String ino,
    required String libraryId,
    required String folderId,
    required String path,
    required String relPath,
    required bool isFile,
    required int mtimeMs,
    required int ctimeMs,
    required int birthtimeMs,
    required int addedAt,
    required int updatedAt,
    required int lastScan,
    required String scanVersion,
    required bool isMissing,
    required bool isInvalid,
    required String mediaType,
    required DetailedMedia media,
    required List<FileMetadata>? libraryFiles,
    required int size,
    required CollapsedSeries? collapsedSeries,
  }) = _DetailedLibraryItem;

  factory DetailedLibraryItem.fromJson(Map<String, dynamic> json) =>
      _$DetailedLibraryItemFromJson(json);
}
