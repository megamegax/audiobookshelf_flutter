import 'dart:async';
import 'dart:io';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/audio_track.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/playback_session.dart';
import 'package:audiobookshelf_flutter/provider/http_client_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

final backgroundDownloadServiceProvider = Provider<BackgroundDownloadService>((ref) {
  return BackgroundDownloadService(
    ref.watch(httpClientProvider),
    ref.watch(serverAddressProvider),
  );
});

class BackgroundDownloadService {
  final http.Client httpClient;
  final String serverAddress;
  
  // Active downloads tracking
  final Map<String, DownloadTask> _activeDownloads = {};
  final StreamController<DownloadProgress> _progressController = 
      StreamController<DownloadProgress>.broadcast();
  
  BackgroundDownloadService(this.httpClient, this.serverAddress);

  /// Stream of download progress updates
  Stream<DownloadProgress> get progressStream => _progressController.stream;

  /// Get active downloads count
  int get activeDownloadsCount => _activeDownloads.length;

  /// Get all active downloads
  Map<String, DownloadTask> get activeDownloads => Map.unmodifiable(_activeDownloads);

  /// Start background download for a track
  Future<void> startBackgroundDownload({
    required UserModel userModel,
    required PlaybackSession playbackSession,
    required String libraryItemId,
    required String libraryItemTitle,
    required AudioTrack track,
    int? priority = 0,
  }) async {
    final taskId = '${libraryItemId}_${track.index}';
    
    // Check if already downloading
    if (_activeDownloads.containsKey(taskId)) {
      debugPrint('Download already in progress for task: $taskId');
      return;
    }

    // Create download task
    final task = DownloadTask(
      id: taskId,
      libraryItemId: libraryItemId,
      libraryItemTitle: libraryItemTitle,
      track: track,
      priority: priority ?? 0,
      status: DownloadStatus.queued,
      progress: 0.0,
      createdAt: DateTime.now(),
    );

    _activeDownloads[taskId] = task;
    _progressController.add(DownloadProgress(taskId: taskId, task: task));

    // Start download in background
    _downloadTrackInBackground(task, userModel, playbackSession);
  }

  /// Download all tracks for a library item in background
  Future<void> downloadAllTracksInBackground({
    required UserModel userModel,
    required PlaybackSession playbackSession,
    required String libraryItemId,
    required String libraryItemTitle,
    int? priority = 0,
  }) async {
    for (int i = 0; i < playbackSession.audioTracks.length; i++) {
      final track = playbackSession.audioTracks[i];
      await startBackgroundDownload(
        userModel: userModel,
        playbackSession: playbackSession,
        libraryItemId: libraryItemId,
        libraryItemTitle: libraryItemTitle,
        track: track,
        priority: priority,
      );
      
      // Small delay between track downloads to avoid overwhelming the server
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  /// Cancel a download
  Future<void> cancelDownload(String taskId) async {
    final task = _activeDownloads[taskId];
    if (task != null) {
      task.status = DownloadStatus.cancelled;
      _progressController.add(DownloadProgress(taskId: taskId, task: task));
      _activeDownloads.remove(taskId);
    }
  }

  /// Cancel all downloads
  Future<void> cancelAllDownloads() async {
    final taskIds = _activeDownloads.keys.toList();
    for (final taskId in taskIds) {
      await cancelDownload(taskId);
    }
  }

  /// Pause a download
  Future<void> pauseDownload(String taskId) async {
    final task = _activeDownloads[taskId];
    if (task != null && task.status == DownloadStatus.downloading) {
      task.status = DownloadStatus.paused;
      _progressController.add(DownloadProgress(taskId: taskId, task: task));
    }
  }

  /// Resume a paused download
  Future<void> resumeDownload(String taskId) async {
    final task = _activeDownloads[taskId];
    if (task != null && task.status == DownloadStatus.paused) {
      task.status = DownloadStatus.downloading;
      _progressController.add(DownloadProgress(taskId: taskId, task: task));
      // Continue download logic would go here
    }
  }

  /// Private method to handle actual download in background
  Future<void> _downloadTrackInBackground(
    DownloadTask task,
    UserModel userModel,
    PlaybackSession playbackSession,
  ) async {
    try {
      // Update status to downloading
      task.status = DownloadStatus.downloading;
      _progressController.add(DownloadProgress(taskId: task.id, task: task));

      // Request storage permission
      final hasPermission = await _requestStoragePermission();
      if (!hasPermission) {
        task.status = DownloadStatus.failed;
        task.error = 'Storage permission denied';
        _progressController.add(DownloadProgress(taskId: task.id, task: task));
        _activeDownloads.remove(task.id);
        return;
      }

      // Get download directory
      final downloadDir = await _getDownloadDirectory(task.libraryItemId);
      if (downloadDir == null) {
        task.status = DownloadStatus.failed;
        task.error = 'Could not create download directory';
        _progressController.add(DownloadProgress(taskId: task.id, task: task));
        _activeDownloads.remove(task.id);
        return;
      }

      // Build download URL
      String downloadUrl;
      if (task.track.contentUrl?.startsWith('/hls') == true) {
        downloadUrl = "$serverAddress${task.track.contentUrl}";
      } else {
        downloadUrl = "$serverAddress/public/session/${playbackSession.id}/track/${task.track.index ?? 1}";
      }

      // Add authentication token
      downloadUrl += "?token=${userModel.token}";

      // Create file path
      final fileName = 'track_${task.track.index ?? 1}.${_getFileExtension(task.track.contentUrl)}';
      final filePath = path.join(downloadDir.path, fileName);
      final file = File(filePath);

      // Check if file already exists
      if (await file.exists()) {
        task.status = DownloadStatus.completed;
        task.progress = 1.0;
        _progressController.add(DownloadProgress(taskId: task.id, task: task));
        _activeDownloads.remove(task.id);
        return;
      }

      // Start download
      final request = http.Request('GET', Uri.parse(downloadUrl));
      final streamedResponse = await httpClient.send(request);

      if (streamedResponse.statusCode != 200) {
        throw Exception('Download failed with status: ${streamedResponse.statusCode}');
      }

      final totalBytes = streamedResponse.contentLength ?? 0;
      int downloadedBytes = 0;

      // Write file with progress tracking
      final sink = file.openWrite();
      await for (final chunk in streamedResponse.stream) {
        if (task.status == DownloadStatus.cancelled) {
          sink.close();
          await file.delete();
          _activeDownloads.remove(task.id);
          return;
        }

        if (task.status == DownloadStatus.paused) {
          sink.close();
          return;
        }

        sink.add(chunk);
        downloadedBytes += chunk.length;

        if (totalBytes > 0) {
          task.progress = downloadedBytes / totalBytes;
          _progressController.add(DownloadProgress(taskId: task.id, task: task));
        }
      }

      await sink.close();

      // Mark as completed
      task.status = DownloadStatus.completed;
      task.progress = 1.0;
      _progressController.add(DownloadProgress(taskId: task.id, task: task));
      _activeDownloads.remove(task.id);

    } catch (e) {
      task.status = DownloadStatus.failed;
      task.error = e.toString();
      _progressController.add(DownloadProgress(taskId: task.id, task: task));
      _activeDownloads.remove(task.id);
    }
  }

  /// Request storage permission
  Future<bool> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.request();
      return status.isGranted;
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS/macOS doesn't need explicit storage permission for app documents
      return true;
    }
    return true;
  }

  /// Get download directory for a library item
  Future<Directory?> _getDownloadDirectory(String libraryItemId) async {
    try {
      Directory appDir;
      if (Platform.isAndroid) {
        appDir = await getExternalStorageDirectory() ?? await getApplicationDocumentsDirectory();
      } else {
        appDir = await getApplicationDocumentsDirectory();
      }

      final downloadDir = Directory(path.join(appDir.path, 'downloads', libraryItemId));
      if (!await downloadDir.exists()) {
        await downloadDir.create(recursive: true);
      }
      return downloadDir;
    } catch (e) {
      debugPrint('Error creating download directory: $e');
      return null;
    }
  }

  /// Get file extension from URL
  String _getFileExtension(String? url) {
    if (url == null) return 'mp3';
    
    final uri = Uri.parse(url);
    final pathSegments = uri.pathSegments;
    if (pathSegments.isNotEmpty) {
      final fileName = pathSegments.last;
      final extension = path.extension(fileName);
      if (extension.isNotEmpty) {
        return extension.substring(1); // Remove the dot
      }
    }
    return 'mp3'; // Default extension
  }

  /// Dispose resources
  void dispose() {
    _progressController.close();
  }
}

/// Download task model
class DownloadTask {
  final String id;
  final String libraryItemId;
  final String libraryItemTitle;
  final AudioTrack track;
  final int priority;
  DownloadStatus status;
  double progress;
  final DateTime createdAt;
  String? error;

  DownloadTask({
    required this.id,
    required this.libraryItemId,
    required this.libraryItemTitle,
    required this.track,
    required this.priority,
    required this.status,
    required this.progress,
    required this.createdAt,
    this.error,
  });
}

/// Download status enum
enum DownloadStatus {
  queued,
  downloading,
  paused,
  completed,
  failed,
  cancelled,
}

/// Download progress model
class DownloadProgress {
  final String taskId;
  final DownloadTask task;

  DownloadProgress({
    required this.taskId,
    required this.task,
  });
}
