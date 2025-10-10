import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';

part 'search_state.freezed.dart';

@freezed
sealed class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(false) bool isSearching,
    @Default([]) List<LibraryItemEntity> results,
    @Default(false) bool hasError,
    String? errorMessage,
  }) = _SearchState;
}
