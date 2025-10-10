import 'package:audiobookshelf_flutter/model/bookmark.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/services/bookmark_service.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for BookmarkService
final bookmarkServiceProvider = Provider<BookmarkService>((ref) {
  final libraryService = ref.read(libraryServiceProvider);
  return BookmarkService(libraryService);
});

// Provider for bookmarks of a specific library item
final bookmarksProvider =
    FutureProvider.family<List<Bookmark>, String>((ref, libraryItemId) async {
  final bookmarkService = ref.read(bookmarkServiceProvider);
  final userModel = ref.read(userModelNotifierProvider);
  if (userModel == null) return [];
  return await bookmarkService.getBookmarks(libraryItemId, userModel);
});

// Notifier for managing bookmark operations
class BookmarkNotifier extends StateNotifier<AsyncValue<List<Bookmark>>> {
  final BookmarkService _bookmarkService;
  final String _libraryItemId;
  final UserModel _userModel;

  BookmarkNotifier(this._bookmarkService, this._libraryItemId, this._userModel)
      : super(const AsyncValue.loading()) {
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    state = const AsyncValue.loading();
    try {
      final bookmarks =
          await _bookmarkService.getBookmarks(_libraryItemId, _userModel);
      state = AsyncValue.data(bookmarks);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> addBookmark(
      int timeInSeconds, String title, String? note) async {
    final currentBookmarks = state.value ?? [];
    state = AsyncValue.data(currentBookmarks);

    try {
      final newBookmark = await _bookmarkService.createBookmark(
        _libraryItemId,
        timeInSeconds,
        title,
        note,
        _userModel,
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
      final updatedBookmark = await _bookmarkService.updateBookmark(
        _libraryItemId,
        bookmarkId,
        title,
        note,
        _userModel,
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
      final success = await _bookmarkService.deleteBookmark(
          _libraryItemId, bookmarkId, _userModel);

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
    await _loadBookmarks();
  }
}

// Provider for bookmark notifier
final bookmarkNotifierProvider = StateNotifierProvider.family<BookmarkNotifier,
    AsyncValue<List<Bookmark>>, String>((ref, libraryItemId) {
  final bookmarkService = ref.read(bookmarkServiceProvider);
  final userModel = ref.read(userModelNotifierProvider);
  if (userModel == null) {
    throw Exception('User not logged in');
  }
  return BookmarkNotifier(bookmarkService, libraryItemId, userModel);
});
