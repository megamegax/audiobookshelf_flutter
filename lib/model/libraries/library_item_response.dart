import 'package:audiobookshelf_flutter/model/libraries/detailed_library_item.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_item_response.freezed.dart';
part 'library_item_response.g.dart';

@freezed
class LibraryItemResponse with _$LibraryItemResponse {
  const factory LibraryItemResponse({
    required DetailedLibraryItem result,
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
  }) = _LibraryItemResponse;

  factory LibraryItemResponse.fromJson(Map<String, dynamic> json) =>
      _$LibraryItemResponseFromJson(json);
}
