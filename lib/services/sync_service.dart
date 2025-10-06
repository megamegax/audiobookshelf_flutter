import 'dart:async';
import 'dart:convert';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/http_client_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(
    ref.watch(httpClientProvider),
    ref.watch(serverAddressProvider),
    ref.watch(loginStateProvider.notifier),
  );
});

class SyncService {
  final http.Client httpClient;
  final String serverAddress;
  final LoginStateNotifier loginStateNotifier;

  // Sync state tracking
  bool _isSyncing = false;
  final StreamController<SyncProgress> _syncProgressController =
      StreamController<SyncProgress>.broadcast();

  // Local storage keys
  static const String _lastSyncTimeKey = 'last_sync_time';
  static const String _offlineProgressKey = 'offline_progress';
  static const String _pendingSyncKey = 'pending_sync';

  SyncService(this.httpClient, this.serverAddress, this.loginStateNotifier);

  /// Stream of sync progress updates
  Stream<SyncProgress> get syncProgressStream => _syncProgressController.stream;

  /// Check if currently syncing
  bool get isSyncing => _isSyncing;

  /// Get last sync time
  Future<DateTime?> getLastSyncTime() async {
    final prefs = await SharedPreferences.getInstance();
    final timestamp = prefs.getInt(_lastSyncTimeKey);
    return timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(timestamp)
        : null;
  }

  /// Set last sync time
  Future<void> _setLastSyncTime(DateTime time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastSyncTimeKey, time.millisecondsSinceEpoch);
  }

  /// Save offline progress locally
  Future<void> saveOfflineProgress(
      String libraryItemId, Map<String, dynamic> progress) async {
    final prefs = await SharedPreferences.getInstance();
    final offlineProgress = prefs.getString(_offlineProgressKey) ?? '{}';
    final Map<String, dynamic> progressMap = jsonDecode(offlineProgress);

    progressMap[libraryItemId] = {
      ...progress,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'needsSync': true,
    };

    await prefs.setString(_offlineProgressKey, jsonEncode(progressMap));
  }

  /// Get offline progress
  Future<Map<String, dynamic>?> getOfflineProgress(String libraryItemId) async {
    final prefs = await SharedPreferences.getInstance();
    final offlineProgress = prefs.getString(_offlineProgressKey) ?? '{}';
    final Map<String, dynamic> progressMap = jsonDecode(offlineProgress);

    return progressMap[libraryItemId];
  }

  /// Get all offline progress that needs syncing
  Future<Map<String, dynamic>> getPendingSyncProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final offlineProgress = prefs.getString(_offlineProgressKey) ?? '{}';
    final Map<String, dynamic> progressMap = jsonDecode(offlineProgress);

    final pendingSync = <String, dynamic>{};
    progressMap.forEach((key, value) {
      if (value['needsSync'] == true) {
        pendingSync[key] = value;
      }
    });

    return pendingSync;
  }

  /// Mark progress as synced
  Future<void> _markProgressAsSynced(String libraryItemId) async {
    final prefs = await SharedPreferences.getInstance();
    final offlineProgress = prefs.getString(_offlineProgressKey) ?? '{}';
    final Map<String, dynamic> progressMap = jsonDecode(offlineProgress);

    if (progressMap.containsKey(libraryItemId)) {
      progressMap[libraryItemId]['needsSync'] = false;
      await prefs.setString(_offlineProgressKey, jsonEncode(progressMap));
    }
  }

  /// Sync progress to server
  Future<void> syncProgressToServer(UserModel userModel) async {
    if (_isSyncing) {
      debugPrint('Sync already in progress');
      return;
    }

    _isSyncing = true;
    _syncProgressController.add(SyncProgress(status: SyncStatus.starting));

    try {
      final pendingProgress = await getPendingSyncProgress();

      if (pendingProgress.isEmpty) {
        _syncProgressController.add(SyncProgress(
          status: SyncStatus.completed,
          message: 'No progress to sync',
        ));
        return;
      }

      _syncProgressController.add(SyncProgress(
        status: SyncStatus.syncing,
        message: 'Syncing ${pendingProgress.length} items...',
        progress: 0.0,
      ));

      int syncedCount = 0;
      final totalCount = pendingProgress.length;

      for (final entry in pendingProgress.entries) {
        final libraryItemId = entry.key;
        final progressData = entry.value;

        try {
          await _syncSingleProgress(userModel, libraryItemId, progressData);
          await _markProgressAsSynced(libraryItemId);
          syncedCount++;

          _syncProgressController.add(SyncProgress(
            status: SyncStatus.syncing,
            message: 'Synced $syncedCount/$totalCount items',
            progress: syncedCount / totalCount,
          ));
        } catch (e) {
          debugPrint('Failed to sync progress for $libraryItemId: $e');
          // Continue with other items
        }
      }

      await _setLastSyncTime(DateTime.now());

      _syncProgressController.add(SyncProgress(
        status: SyncStatus.completed,
        message: 'Successfully synced $syncedCount items',
        progress: 1.0,
      ));
    } catch (e) {
      _syncProgressController.add(SyncProgress(
        status: SyncStatus.failed,
        message: 'Sync failed: $e',
      ));
    } finally {
      _isSyncing = false;
    }
  }

  /// Sync single progress item
  Future<void> _syncSingleProgress(
    UserModel userModel,
    String libraryItemId,
    Map<String, dynamic> progressData,
  ) async {
    final requestBody = {
      'currentTime': progressData['currentTime'] ?? 0,
      'duration': progressData['duration'] ?? 0,
      'progress': progressData['progress'] ?? 0.0,
      'isFinished': progressData['isFinished'] ?? false,
    };

    final response = await _makeAuthenticatedRequest(
      'POST',
      '/api/items/$libraryItemId/progress',
      userModel: userModel,
      body: jsonEncode(requestBody),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to sync progress: ${response.statusCode}');
    }
  }

  /// Download progress from server
  Future<void> downloadProgressFromServer(UserModel userModel) async {
    if (_isSyncing) {
      debugPrint('Sync already in progress');
      return;
    }

    _isSyncing = true;
    _syncProgressController.add(SyncProgress(status: SyncStatus.downloading));

    try {
      final response = await _makeAuthenticatedRequest(
        'GET',
        '/api/user/progress',
        userModel: userModel,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final progressList = responseData['progress'] as List<dynamic>? ?? [];

        // Save progress to local storage
        final prefs = await SharedPreferences.getInstance();
        final Map<String, dynamic> localProgress = {};

        for (final progressItem in progressList) {
          final libraryItemId = progressItem['libraryItemId'] as String?;
          if (libraryItemId != null) {
            localProgress[libraryItemId] = {
              'currentTime': progressItem['currentTime'] ?? 0,
              'duration': progressItem['duration'] ?? 0,
              'progress': progressItem['progress'] ?? 0.0,
              'isFinished': progressItem['isFinished'] ?? false,
              'timestamp': DateTime.now().millisecondsSinceEpoch,
              'needsSync':
                  false, // Downloaded from server, no need to sync back
            };
          }
        }

        await prefs.setString(_offlineProgressKey, jsonEncode(localProgress));

        _syncProgressController.add(SyncProgress(
          status: SyncStatus.completed,
          message: 'Downloaded ${progressList.length} progress items',
        ));
      } else {
        throw Exception('Failed to download progress: ${response.statusCode}');
      }
    } catch (e) {
      _syncProgressController.add(SyncProgress(
        status: SyncStatus.failed,
        message: 'Download failed: $e',
      ));
    } finally {
      _isSyncing = false;
    }
  }

  /// Full sync (upload and download)
  Future<void> fullSync(UserModel userModel) async {
    if (_isSyncing) {
      debugPrint('Sync already in progress');
      return;
    }

    _isSyncing = true;
    _syncProgressController.add(SyncProgress(status: SyncStatus.starting));

    try {
      // First upload local progress
      await syncProgressToServer(userModel);

      // Then download server progress
      await downloadProgressFromServer(userModel);

      _syncProgressController.add(SyncProgress(
        status: SyncStatus.completed,
        message: 'Full sync completed',
      ));
    } catch (e) {
      _syncProgressController.add(SyncProgress(
        status: SyncStatus.failed,
        message: 'Full sync failed: $e',
      ));
    } finally {
      _isSyncing = false;
    }
  }

  /// Make authenticated request with automatic token refresh
  Future<http.Response> _makeAuthenticatedRequest(
    String method,
    String endpoint, {
    Map<String, String>? headers,
    String? body,
    UserModel? userModel,
  }) async {
    final requestHeaders = <String, String>{
      'Content-Type': 'application/json',
      ...?headers,
    };

    if (userModel != null) {
      requestHeaders['Authorization'] = 'Bearer ${userModel.token}';
    }

    final uri = Uri.parse('$serverAddress$endpoint');
    http.Response response;

    if (method.toUpperCase() == 'GET') {
      response = await httpClient.get(uri, headers: requestHeaders);
    } else if (method.toUpperCase() == 'POST') {
      response =
          await httpClient.post(uri, headers: requestHeaders, body: body);
    } else if (method.toUpperCase() == 'PATCH') {
      response =
          await httpClient.patch(uri, headers: requestHeaders, body: body);
    } else {
      throw UnsupportedError('HTTP method $method not supported');
    }

    // Handle 401 Unauthorized - try to refresh token
    if (response.statusCode == 401 && userModel != null) {
      final newToken = await loginStateNotifier.refreshToken();
      if (newToken != null) {
        // Retry the request with the new token
        requestHeaders['Authorization'] = 'Bearer $newToken';

        if (method.toUpperCase() == 'GET') {
          response = await httpClient.get(uri, headers: requestHeaders);
        } else if (method.toUpperCase() == 'POST') {
          response =
              await httpClient.post(uri, headers: requestHeaders, body: body);
        } else if (method.toUpperCase() == 'PATCH') {
          response =
              await httpClient.patch(uri, headers: requestHeaders, body: body);
        }
      }
    }

    return response;
  }

  /// Clear all local progress data
  Future<void> clearLocalProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_offlineProgressKey);
    await prefs.remove(_lastSyncTimeKey);
  }

  /// Dispose resources
  void dispose() {
    _syncProgressController.close();
  }
}

/// Sync progress model
class SyncProgress {
  final SyncStatus status;
  final String? message;
  final double? progress;

  SyncProgress({
    required this.status,
    this.message,
    this.progress,
  });
}

/// Sync status enum
enum SyncStatus {
  starting,
  syncing,
  downloading,
  completed,
  failed,
}
