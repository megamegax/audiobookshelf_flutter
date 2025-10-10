import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/detailed_library_item.dart';

part 'book_details_state.freezed.dart';

// Data loading state
@freezed
sealed class BookDetailsData with _$BookDetailsData {
  const factory BookDetailsData({
    required LibraryItemEntity item,
    DetailedLibraryItem? detailedItem,
    @Default(false) bool isLoading,
    String? error,
  }) = _BookDetailsData;
}

// UI state
@freezed
sealed class BookDetailsUI with _$BookDetailsUI {
  const factory BookDetailsUI({
    @Default(false) bool isDescriptionExpanded,
    @Default(false) bool showCoverModal,
    @Default(<String>{}) Set<String> expandedSections,
  }) = _BookDetailsUI;
}
