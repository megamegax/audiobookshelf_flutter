import 'package:audiobookshelf_flutter/model/libraries/library_item_new.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_items_response.freezed.dart';

@Freezed(toJson: false)
class LibraryItemsResponse with _$LibraryItemsResponse {
  const factory LibraryItemsResponse({
    required List<LibraryItemNew> results,
    required int total,
    int? limit,
    int? page,
    String? sortBy,
    required bool sortDesc,
    String? filterBy,
    required String mediaType,
    required bool minified,
    required bool collapseseries,
    String? include,
  }) = _LibraryItemsResponse;

  factory LibraryItemsResponse.fromJson(Map<String, dynamic> json) {
    return LibraryItemsResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => LibraryItemNew.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      limit: json['limit'] as int?,
      page: json['page'] as int?,
      sortBy: json['sortBy'] as String?,
      sortDesc: json['sortDesc'] as bool,
      filterBy: json['filterBy'] as String?,
      mediaType: json['mediaType'] as String,
      minified: json['minified'] as bool,
      collapseseries: json['collapseseries'] as bool,
      include: json['include'] as String?,
    );
  }
}
