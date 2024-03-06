import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'libraries_response.freezed.dart';
part 'libraries_response.g.dart';

@freezed
class LibrariesResponse with _$LibrariesResponse {
  const factory LibrariesResponse({
    required List<Library> libraries,
  }) = _LibrariesResponse;

  factory LibrariesResponse.fromJson(Map<String, dynamic> json) =>
      _$LibrariesResponseFromJson(json);
}
