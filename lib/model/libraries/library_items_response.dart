import 'package:audiobookshelf_flutter/model/libraries/library_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_items_response.freezed.dart';
part 'library_items_response.g.dart';

@freezed
class LibraryItemsResponse with _$LibraryItemsResponse {
  const factory LibraryItemsResponse({
    required List<LibraryItem> results,
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

  factory LibraryItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$LibraryItemsResponseFromJson(json);
}
