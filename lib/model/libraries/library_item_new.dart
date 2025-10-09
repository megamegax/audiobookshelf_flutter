import 'dart:typed_data';
import 'package:audiobookshelf_flutter/model/libraries/collapsed_series.dart';
import 'package:audiobookshelf_flutter/model/libraries/media.dart';
import 'package:audiobookshelf_flutter/model/libraries/meta_data.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_item_new.freezed.dart';

/// Union type for different library item types
/// This separates books and podcasts into different models while providing type safety
@freezed
sealed class LibraryItemNew with _$LibraryItemNew {
  const factory LibraryItemNew.book({
    required String id,
    String? ino,
    required String libraryId,
    required String folderId,
    required String path,
    required String relPath,
    required bool isFile,
    int? mtimeMs,
    int? ctimeMs,
    int? birthtimeMs,
    int? addedAt,
    int? updatedAt,
    required bool isMissing,
    required bool isInvalid,
    required String mediaType,
    required Media media,
    int? numFiles,
    int? size,
    CollapsedSeries? collapsedSeries,
  }) = _BookLibraryItemNew;

  const factory LibraryItemNew.podcast({
    required String id,
    String? ino,
    required String libraryId,
    required String folderId,
    required String path,
    required String relPath,
    required bool isFile,
    int? mtimeMs,
    int? ctimeMs,
    int? birthtimeMs,
    int? addedAt,
    int? updatedAt,
    required bool isMissing,
    required bool isInvalid,
    required String mediaType,
    required Media media,
    // Podcasts may not have these fields, so they remain nullable
    int? numFiles,
    int? size,
    CollapsedSeries? collapsedSeries,
  }) = _PodcastLibraryItemNew;

  /// Custom factory constructor that routes to the appropriate constructor based on mediaType
  factory LibraryItemNew.fromJson(Map<String, dynamic> json) {
    final mediaType = json['mediaType'] as String;
    final ino = _parseIno(json['ino']);

    final baseFields = {
      'id': json['id'] as String,
      'ino': ino,
      'libraryId': json['libraryId'] as String,
      'folderId': json['folderId'] as String,
      'path': json['path'] as String,
      'relPath': json['relPath'] as String,
      'isFile': json['isFile'] as bool,
      'mtimeMs': (json['mtimeMs'] as num?)?.toInt(),
      'ctimeMs': (json['ctimeMs'] as num?)?.toInt(),
      'birthtimeMs': (json['birthtimeMs'] as num?)?.toInt(),
      'addedAt': (json['addedAt'] as num?)?.toInt(),
      'updatedAt': (json['updatedAt'] as num?)?.toInt(),
      'isMissing': json['isMissing'] as bool,
      'isInvalid': json['isInvalid'] as bool,
      'mediaType': mediaType,
      'media': Media.fromJson(json['media'] as Map<String, dynamic>),
      'collapsedSeries': json['collapsedSeries'] != null
          ? CollapsedSeries.fromJson(
              json['collapsedSeries'] as Map<String, dynamic>)
          : null,
    };

    switch (mediaType) {
      case 'book':
        return LibraryItemNew.book(
          id: baseFields['id'] as String,
          ino: baseFields['ino'] as String?,
          libraryId: baseFields['libraryId'] as String,
          folderId: baseFields['folderId'] as String,
          path: baseFields['path'] as String,
          relPath: baseFields['relPath'] as String,
          isFile: baseFields['isFile'] as bool,
          mtimeMs: baseFields['mtimeMs'] as int?,
          ctimeMs: baseFields['ctimeMs'] as int?,
          birthtimeMs: baseFields['birthtimeMs'] as int?,
          addedAt: baseFields['addedAt'] as int?,
          updatedAt: baseFields['updatedAt'] as int?,
          isMissing: baseFields['isMissing'] as bool,
          isInvalid: baseFields['isInvalid'] as bool,
          mediaType: baseFields['mediaType'] as String,
          media: baseFields['media'] as Media,
          numFiles: (json['numFiles'] as num?)?.toInt(),
          size: (json['size'] as num?)?.toInt(),
          collapsedSeries: baseFields['collapsedSeries'] as CollapsedSeries?,
        );
      case 'podcast':
        return LibraryItemNew.podcast(
          id: baseFields['id'] as String,
          ino: baseFields['ino'] as String?,
          libraryId: baseFields['libraryId'] as String,
          folderId: baseFields['folderId'] as String,
          path: baseFields['path'] as String,
          relPath: baseFields['relPath'] as String,
          isFile: baseFields['isFile'] as bool,
          mtimeMs: baseFields['mtimeMs'] as int?,
          ctimeMs: baseFields['ctimeMs'] as int?,
          birthtimeMs: baseFields['birthtimeMs'] as int?,
          addedAt: baseFields['addedAt'] as int?,
          updatedAt: baseFields['updatedAt'] as int?,
          isMissing: baseFields['isMissing'] as bool,
          isInvalid: baseFields['isInvalid'] as bool,
          mediaType: baseFields['mediaType'] as String,
          media: baseFields['media'] as Media,
          numFiles: (json['numFiles'] as num?)?.toInt(),
          size: (json['size'] as num?)?.toInt(),
          collapsedSeries: baseFields['collapsedSeries'] as CollapsedSeries?,
        );
      default:
        throw ArgumentError('Unknown mediaType: $mediaType');
    }
  }
}

/// Helper function to parse ino field which can be int or string
String? _parseIno(dynamic value) {
  if (value == null) return null;
  if (value is String) return value;
  if (value is int) return value.toString();
  return value.toString();
}

/// Extension to convert LibraryItemEntity to LibraryItemNew
extension LibraryItemEntityToNew on LibraryItemEntity {
  LibraryItemNew toLibraryItemNew() {
    // Convert MediaEntity to Media - simplified version
    final mediaEntity = this.media;
    final media = Media(
      metadata: Metadata(
        title: mediaEntity.metadata?.title,
        subtitle: mediaEntity.metadata?.subtitle,
        authorName: mediaEntity.metadata?.authorName,
        narratorName: mediaEntity.metadata?.narratorName,
        seriesName: mediaEntity.metadata?.seriesName,
        genres: mediaEntity.metadata?.genres,
        publishedYear: mediaEntity.metadata?.publishedYear != null
            ? int.tryParse(mediaEntity.metadata!.publishedYear!)
            : null,
        publishedDate: mediaEntity.metadata?.publishedDate,
        publisher: mediaEntity.metadata?.publisher,
        description: mediaEntity.metadata?.description,
        isbn: mediaEntity.metadata?.isbn,
        asin: mediaEntity.metadata?.asin,
        language: mediaEntity.metadata?.language,
        explicit: mediaEntity.metadata?.explicit ?? false,
      ),
      coverPath: mediaEntity.coverPath,
      coverBytes: mediaEntity.coverBytes != null
          ? Uint8List.fromList(mediaEntity.coverBytes!)
          : null,
      tags: mediaEntity.tags,
      duration: mediaEntity.duration,
      size: mediaEntity.size,
    );

    // Convert CollapsedSeriesEntity to CollapsedSeries if present
    CollapsedSeries? collapsedSeries;
    if (this.collapsedSeries != null) {
      collapsedSeries = CollapsedSeries(
        id: this.collapsedSeries!.id ?? '',
        name: this.collapsedSeries!.name ?? '',
        nameIgnorePrefix: this.collapsedSeries!.nameIgnorePrefix ?? '',
        numBooks: this.collapsedSeries!.numBooks,
      );
    }

    // Create the appropriate LibraryItemNew based on mediaType
    switch (mediaType) {
      case 'book':
        return LibraryItemNew.book(
          id: itemId,
          ino: ino,
          libraryId: libraryId,
          folderId: folderId,
          path: path,
          relPath: relPath,
          isFile: isFile,
          mtimeMs: mtimeMs,
          ctimeMs: ctimeMs,
          birthtimeMs: birthtimeMs,
          addedAt: addedAt,
          updatedAt: updatedAt,
          isMissing: isMissing,
          isInvalid: isInvalid,
          mediaType: mediaType,
          media: media,
          numFiles: numFiles,
          size: size,
          collapsedSeries: collapsedSeries,
        );
      case 'podcast':
        return LibraryItemNew.podcast(
          id: itemId,
          ino: ino,
          libraryId: libraryId,
          folderId: folderId,
          path: path,
          relPath: relPath,
          isFile: isFile,
          mtimeMs: mtimeMs,
          ctimeMs: ctimeMs,
          birthtimeMs: birthtimeMs,
          addedAt: addedAt,
          updatedAt: updatedAt,
          isMissing: isMissing,
          isInvalid: isInvalid,
          mediaType: mediaType,
          media: media,
          numFiles: numFiles,
          size: size,
          collapsedSeries: collapsedSeries,
        );
      default:
        throw ArgumentError('Unknown mediaType: $mediaType');
    }
  }
}
