import 'package:audiobookshelf_flutter/model/bookmark.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/services/bookmark_service.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmark_provider.g.dart';

// Provider for BookmarkService
@riverpod
BookmarkService bookmarkService(Ref ref) {
  final libraryService = ref.read(libraryServiceProvider);
  return BookmarkService(libraryService);
}

// Provider for bookmarks of a specific library item
@riverpod
Future<List<Bookmark>> bookmarks(Ref ref, String libraryItemId) async {
  final bookmarkService = ref.read(bookmarkServiceProvider);
  final userModel = ref.read(userModelProvider);
  if (userModel == null) return [];
  return await bookmarkService.getBookmarks(libraryItemId, userModel);
}

// Notifier for managing bookmark operations
@riverpod
class BookmarkNotifier extends _$BookmarkNotifier {
  @override
  Future<List<Bookmark>> build(String libraryItemId) async {
    final bookmarkService = ref.read(bookmarkServiceProvider);
    final userModel = ref.read(userModelProvider);
    if (userModel == null) return [];
    return await bookmarkService.getBookmarks(libraryItemId, userModel);
  }

  Future<void> addBookmark(
      int timeInSeconds, String title, String? note) async {
    final currentBookmarks = state.value ?? [];
    state = AsyncValue.data(currentBookmarks);

    try {
      final bookmarkService = ref.read(bookmarkServiceProvider);
      final userModel = ref.read(userModelProvider);
      if (userModel == null) return;

      final newBookmark = await bookmarkService.createBookmark(
        libraryItemId,
        timeInSeconds,
        title,
        note,
        userModel,
      );

      if (newBookmark != null) {
        final updatedBookmarks = [...currentBookmarks, newBookmark];
        state = AsyncValue.data(updatedBookmarks);
      } else {
        // Revert to previous state if creation failed
        state = AsyncValue.data(currentBookmarks);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> updateBookmark(
      String bookmarkId, String title, String? note) async {
    final currentBookmarks = state.value ?? [];
    state = AsyncValue.data(currentBookmarks);

    try {
      final bookmarkService = ref.read(bookmarkServiceProvider);
      final userModel = ref.read(userModelProvider);
      if (userModel == null) return;

      final updatedBookmark = await bookmarkService.updateBookmark(
        libraryItemId,
        bookmarkId,
        title,
        note,
        userModel,
      );

      if (updatedBookmark != null) {
        final updatedBookmarks = currentBookmarks.map((bookmark) {
          return bookmark.id == bookmarkId ? updatedBookmark : bookmark;
        }).toList();
        state = AsyncValue.data(updatedBookmarks);
      } else {
        // Revert to previous state if update failed
        state = AsyncValue.data(currentBookmarks);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> deleteBookmark(String bookmarkId) async {
    final currentBookmarks = state.value ?? [];
    state = AsyncValue.data(currentBookmarks);

    try {
      final bookmarkService = ref.read(bookmarkServiceProvider);
      final userModel = ref.read(userModelProvider);
      if (userModel == null) return;

      final success = await bookmarkService.deleteBookmark(
          libraryItemId, bookmarkId, userModel);

      if (success) {
        final updatedBookmarks = currentBookmarks
            .where((bookmark) => bookmark.id != bookmarkId)
            .toList();
        state = AsyncValue.data(updatedBookmarks);
      } else {
        // Revert to previous state if deletion failed
        state = AsyncValue.data(currentBookmarks);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
