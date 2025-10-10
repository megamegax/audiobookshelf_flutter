import 'dart:typed_data';
import 'package:audiobookshelf_flutter/model/libraries/detailed_library_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedBookState {
  final DetailedLibraryItem? book;
  final Uint8List? coverImageBytes;

  const SelectedBookState({
    this.book,
    this.coverImageBytes,
  });

  SelectedBookState copyWith({
    DetailedLibraryItem? book,
    Uint8List? coverImageBytes,
  }) {
    return SelectedBookState(
      book: book ?? this.book,
      coverImageBytes: coverImageBytes ?? this.coverImageBytes,
    );
  }
}

class SelectedBookNotifier extends StateNotifier<SelectedBookState> {
  SelectedBookNotifier() : super(const SelectedBookState());

  void selectBook(DetailedLibraryItem book, {Uint8List? coverImageBytes}) {
    state = SelectedBookState(
      book: book,
      coverImageBytes: coverImageBytes,
    );
  }

  void updateCoverImage(Uint8List coverImageBytes) {
    state = state.copyWith(coverImageBytes: coverImageBytes);
  }

  void clearSelection() {
    state = const SelectedBookState();
  }
}

final selectedBookProvider =
    StateNotifierProvider<SelectedBookNotifier, SelectedBookState>((ref) {
  return SelectedBookNotifier();
});
