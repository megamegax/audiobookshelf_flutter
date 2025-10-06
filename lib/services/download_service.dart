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

final downloadServiceProvider = Provider<DownloadService>((ref) {
  return DownloadService(
    ref.watch(httpClientProvider),
    ref.watch(serverAddressProvider),
  );
});

class DownloadService {
  final http.Client httpClient;
  final String serverAddress;

  DownloadService(this.httpClient, this.serverAddress);

  /// Downloads an audio track to local storage
  Future<String?> downloadTrack({
    required UserModel userModel,
    required PlaybackSession playbackSession,
    required AudioTrack track,
    required String libraryItemId,
    required String libraryItemTitle,
    Function(double)? onProgress,
  }) async {
    try {
      // Request storage permission
      final permission = await Permission.storage.request();
      if (!permission.isGranted) {
        throw Exception('Storage permission denied');
      }

      // Get download directory
      final directory = await getApplicationDocumentsDirectory();
      final downloadDir =
          Directory(path.join(directory.path, 'audiobookshelf', 'downloads'));

      if (!await downloadDir.exists()) {
        await downloadDir.create(recursive: true);
      }

      // Create library item directory
      final sanitizedTitle = _sanitizeFilename(libraryItemTitle);
      final itemDir = Directory(path.join(downloadDir.path, sanitizedTitle));
      if (!await itemDir.exists()) {
        await itemDir.create(recursive: true);
      }

      // Build download URL
      String downloadUrl;
      if (track.contentUrl?.startsWith('/hls') == true) {
        downloadUrl = "$serverAddress${track.contentUrl}";
      } else {
        downloadUrl =
            "$serverAddress/public/session/${playbackSession.id}/track/${track.index ?? 1}";
      }

      // Add token to URL
      downloadUrl += "?token=${userModel.token}";

      // Determine file extension
      final mimeType = track.mimeType ?? 'audio/mpeg';
      final extension = _getFileExtensionFromMimeType(mimeType);
      final fileName = "track_${track.index ?? 1}$extension";
      final filePath = path.join(itemDir.path, fileName);

      // Download the file
      final request = http.Request('GET', Uri.parse(downloadUrl));
      request.headers['Authorization'] = 'Bearer ${userModel.token}';

      final streamedResponse = await httpClient.send(request);

      if (streamedResponse.statusCode != 200) {
        throw Exception(
            'Failed to download track: ${streamedResponse.statusCode}');
      }

      final file = File(filePath);
      final sink = file.openWrite();

      int downloadedBytes = 0;
      final totalBytes = streamedResponse.contentLength ?? 0;

      await for (final chunk in streamedResponse.stream) {
        sink.add(chunk);
        downloadedBytes += chunk.length;

        if (totalBytes > 0 && onProgress != null) {
          final progress = downloadedBytes / totalBytes;
          onProgress(progress);
        }
      }

      await sink.close();

      // Save metadata
      await _saveTrackMetadata(itemDir.path, track, libraryItemId);

      return filePath;
    } catch (e) {
      debugPrint('Download error: $e');
      return null;
    }
  }

  /// Downloads all tracks for a library item
  Future<List<String>> downloadAllTracks({
    required UserModel userModel,
    required PlaybackSession playbackSession,
    required String libraryItemId,
    required String libraryItemTitle,
    Function(double)? onProgress,
  }) async {
    final downloadedFiles = <String>[];
    final totalTracks = playbackSession.audioTracks.length;

    for (int i = 0; i < totalTracks; i++) {
      final track = playbackSession.audioTracks[i];
      final trackProgress = (i / totalTracks);

      final filePath = await downloadTrack(
        userModel: userModel,
        playbackSession: playbackSession,
        track: track,
        libraryItemId: libraryItemId,
        libraryItemTitle: libraryItemTitle,
        onProgress: (progress) {
          if (onProgress != null) {
            final overallProgress = trackProgress + (progress / totalTracks);
            onProgress(overallProgress);
          }
        },
      );

      if (filePath != null) {
        downloadedFiles.add(filePath);
      }
    }

    return downloadedFiles;
  }

  /// Gets list of downloaded items
  Future<List<DownloadedItem>> getDownloadedItems() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final downloadDir =
          Directory(path.join(directory.path, 'audiobookshelf', 'downloads'));

      if (!await downloadDir.exists()) {
        return [];
      }

      final items = <DownloadedItem>[];
      await for (final entity in downloadDir.list()) {
        if (entity is Directory) {
          final metadataFile = File(path.join(entity.path, 'metadata.json'));
          if (await metadataFile.exists()) {
            final metadata = await metadataFile.readAsString();
            // Parse metadata and create DownloadedItem
            items.add(DownloadedItem(
              id: path.basename(entity.path),
              title: path.basename(entity.path),
              path: entity.path,
              tracks: await _getTracksInDirectory(entity.path),
            ));
          }
        }
      }

      return items;
    } catch (e) {
      debugPrint('Error getting downloaded items: $e');
      return [];
    }
  }

  /// Deletes a downloaded item
  Future<bool> deleteDownloadedItem(String itemPath) async {
    try {
      final directory = Directory(itemPath);
      if (await directory.exists()) {
        await directory.delete(recursive: true);
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Error deleting downloaded item: $e');
      return false;
    }
  }

  Future<List<String>> _getTracksInDirectory(String dirPath) async {
    final directory = Directory(dirPath);
    final tracks = <String>[];

    await for (final entity in directory.list()) {
      if (entity is File) {
        final extension = path.extension(entity.path).toLowerCase();
        if (['.mp3', '.m4a', '.aac', '.flac', '.ogg'].contains(extension)) {
          tracks.add(entity.path);
        }
      }
    }

    return tracks;
  }

  Future<void> _saveTrackMetadata(
      String dirPath, AudioTrack track, String libraryItemId) async {
    final metadataFile = File(path.join(dirPath, 'metadata.json'));
    final metadata = {
      'libraryItemId': libraryItemId,
      'trackIndex': track.index,
      'title': track.title,
      'duration': track.duration,
      'mimeType': track.mimeType,
      'downloadedAt': DateTime.now().toIso8601String(),
    };

    await metadataFile.writeAsString(metadata.toString());
  }

  String _sanitizeFilename(String filename) {
    return filename
        .replaceAll(RegExp(r'[<>:"/\\|?*]'), '_')
        .replaceAll(RegExp(r'\s+'), '_')
        .trim();
  }

  String _getFileExtensionFromMimeType(String mimeType) {
    switch (mimeType) {
      case 'audio/mpeg':
        return '.mp3';
      case 'audio/mp4':
      case 'audio/m4a':
        return '.m4a';
      case 'audio/aac':
        return '.aac';
      case 'audio/flac':
        return '.flac';
      case 'audio/ogg':
        return '.ogg';
      default:
        return '.mp3';
    }
  }
}

class DownloadedItem {
  final String id;
  final String title;
  final String path;
  final List<String> tracks;

  DownloadedItem({
    required this.id,
    required this.title,
    required this.path,
    required this.tracks,
  });
}
