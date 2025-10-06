import 'dart:convert';

import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EbookProgressService {
  final UserModel userModel;
  final LibraryService libraryService;
  final WidgetRef ref;
  final String _offlineProgressKey = 'offline_ebook_progress';

  EbookProgressService({
    required this.userModel,
    required this.libraryService,
    required this.ref,
  });

  /// Update ebook progress on server
  Future<void> updateProgress(
    String libraryItemId,
    double progress,
    String location,
  ) async {
    try {
      // Update server progress
      await _updateServerProgress(libraryItemId, progress, location);

      // Update local progress
      await _updateLocalProgress(libraryItemId, progress, location);

      if (kDebugMode) {
        print(
            '[EBOOK_PROGRESS] Updated progress for $libraryItemId: ${(progress * 100).toStringAsFixed(1)}% at $location');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EBOOK_PROGRESS] Error updating progress: $e');
      }
      rethrow;
    }
  }

  /// Get ebook progress from local storage
  Future<Map<String, dynamic>?> getProgress(String libraryItemId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final progressData =
          prefs.getString('$_offlineProgressKey$libraryItemId');

      if (progressData != null) {
        return jsonDecode(progressData);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('[EBOOK_PROGRESS] Error getting progress: $e');
      }
      return null;
    }
  }

  /// Update progress on server
  Future<void> _updateServerProgress(
    String libraryItemId,
    double progress,
    String location,
  ) async {
    try {
      final serverAddress = ref.read(serverAddressProvider);

      final url = Uri.parse('$serverAddress/api/me/progress/$libraryItemId');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userModel.token}',
      };

      final body = jsonEncode({
        'ebookLocation': location,
        'ebookProgress': progress,
        'lastUpdate': DateTime.now().millisecondsSinceEpoch,
      });

      final response = await http.patch(url, headers: headers, body: body);

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to update server progress: ${response.statusCode}');
      }

      if (kDebugMode) {
        print('[EBOOK_PROGRESS] Server progress updated successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EBOOK_PROGRESS] Error updating server progress: $e');
      }
      // Don't rethrow - we'll still save locally
    }
  }

  /// Update progress in local storage
  Future<void> _updateLocalProgress(
    String libraryItemId,
    double progress,
    String location,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final progressData = {
        'ebookLocation': location,
        'ebookProgress': progress,
        'lastUpdate': DateTime.now().millisecondsSinceEpoch,
        'needsSync': true,
      };

      await prefs.setString(
        '$_offlineProgressKey$libraryItemId',
        jsonEncode(progressData),
      );

      if (kDebugMode) {
        print('[EBOOK_PROGRESS] Local progress updated successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EBOOK_PROGRESS] Error updating local progress: $e');
      }
      rethrow;
    }
  }

  /// Sync all pending progress to server
  Future<void> syncPendingProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final keys =
          prefs.getKeys().where((key) => key.startsWith(_offlineProgressKey));

      for (final key in keys) {
        final progressData = prefs.getString(key);
        if (progressData != null) {
          final data = jsonDecode(progressData);
          if (data['needsSync'] == true) {
            final libraryItemId = key.replaceFirst(_offlineProgressKey, '');
            await _updateServerProgress(
              libraryItemId,
              data['ebookProgress'] ?? 0.0,
              data['ebookLocation'] ?? '',
            );

            // Mark as synced
            data['needsSync'] = false;
            await prefs.setString(key, jsonEncode(data));
          }
        }
      }

      if (kDebugMode) {
        print('[EBOOK_PROGRESS] Pending progress synced successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EBOOK_PROGRESS] Error syncing pending progress: $e');
      }
    }
  }

  /// Get all pending progress items
  Future<List<Map<String, dynamic>>> getPendingProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final keys =
          prefs.getKeys().where((key) => key.startsWith(_offlineProgressKey));
      final pendingItems = <Map<String, dynamic>>[];

      for (final key in keys) {
        final progressData = prefs.getString(key);
        if (progressData != null) {
          final data = jsonDecode(progressData);
          if (data['needsSync'] == true) {
            data['libraryItemId'] = key.replaceFirst(_offlineProgressKey, '');
            pendingItems.add(data);
          }
        }
      }

      return pendingItems;
    } catch (e) {
      if (kDebugMode) {
        print('[EBOOK_PROGRESS] Error getting pending progress: $e');
      }
      return [];
    }
  }
}
