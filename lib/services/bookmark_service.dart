import 'dart:convert';
import 'package:audiobookshelf_flutter/model/bookmark.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:flutter/foundation.dart';

class BookmarkService {
  final LibraryService _libraryService;

  BookmarkService(this._libraryService);

  /// Get all bookmarks for a library item
  Future<List<Bookmark>> getBookmarks(
      String libraryItemId, UserModel userModel) async {
    try {
      final response = await _libraryService.makeAuthenticatedRequest(
        'GET',
        '/api/me/items/$libraryItemId/bookmarks',
        userModel: userModel,
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody is List) {
          return responseBody.map((json) => Bookmark.fromJson(json)).toList();
        } else if (responseBody is Map &&
            responseBody.containsKey('bookmarks')) {
          final bookmarks =
              List<Map<String, dynamic>>.from(responseBody['bookmarks']);
          return bookmarks.map((json) => Bookmark.fromJson(json)).toList();
        } else {
          if (kDebugMode) {
            print(
                '[BOOKMARK_SERVICE] Unexpected bookmarks response structure: $responseBody');
          }
          return [];
        }
      } else {
        if (kDebugMode) {
          print(
              '[BOOKMARK_SERVICE] Failed to get bookmarks: ${response.statusCode}');
        }
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BOOKMARK_SERVICE] Error getting bookmarks: $e');
      }
      return [];
    }
  }

  /// Create a new bookmark
  Future<Bookmark?> createBookmark(
    String libraryItemId,
    int timeInSeconds,
    String title,
    String? note,
    UserModel userModel,
  ) async {
    try {
      final payload = {
        'time': timeInSeconds,
        'title': title,
        if (note != null && note.isNotEmpty) 'note': note,
      };

      final response = await _libraryService.makeAuthenticatedRequest(
        'POST',
        '/api/me/items/$libraryItemId/bookmark',
        body: jsonEncode(payload),
        userModel: userModel,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return Bookmark.fromJson(responseBody);
      } else {
        if (kDebugMode) {
          print(
              '[BOOKMARK_SERVICE] Failed to create bookmark: ${response.statusCode}');
          print('[BOOKMARK_SERVICE] Response: ${response.body}');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BOOKMARK_SERVICE] Error creating bookmark: $e');
      }
      return null;
    }
  }

  /// Update an existing bookmark
  Future<Bookmark?> updateBookmark(
    String libraryItemId,
    String bookmarkId,
    String title,
    String? note,
    UserModel userModel,
  ) async {
    try {
      final payload = {
        'title': title,
        if (note != null && note.isNotEmpty) 'note': note,
      };

      final response = await _libraryService.makeAuthenticatedRequest(
        'PATCH',
        '/api/me/items/$libraryItemId/bookmark/$bookmarkId',
        body: jsonEncode(payload),
        userModel: userModel,
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        return Bookmark.fromJson(responseBody);
      } else {
        if (kDebugMode) {
          print(
              '[BOOKMARK_SERVICE] Failed to update bookmark: ${response.statusCode}');
          print('[BOOKMARK_SERVICE] Response: ${response.body}');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BOOKMARK_SERVICE] Error updating bookmark: $e');
      }
      return null;
    }
  }

  /// Delete a bookmark
  Future<bool> deleteBookmark(
      String libraryItemId, String bookmarkId, UserModel userModel) async {
    try {
      final response = await _libraryService.makeAuthenticatedRequest(
        'DELETE',
        '/api/me/items/$libraryItemId/bookmark/$bookmarkId',
        userModel: userModel,
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      } else {
        if (kDebugMode) {
          print(
              '[BOOKMARK_SERVICE] Failed to delete bookmark: ${response.statusCode}');
          print('[BOOKMARK_SERVICE] Response: ${response.body}');
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BOOKMARK_SERVICE] Error deleting bookmark: $e');
      }
      return false;
    }
  }
}
