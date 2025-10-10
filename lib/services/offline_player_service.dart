import 'package:audiobookshelf_flutter/services/download_service.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path/path.dart' as path;

final offlinePlayerServiceProvider = Provider<OfflinePlayerService>((ref) {
  final audioPlayerNotifier = ref.watch(audioPlayerProvider.notifier);
  return OfflinePlayerService(
    audioPlayerNotifier.audioPlayer,
    ref.watch(downloadServiceProvider),
  );
});

class OfflinePlayerService {
  final AudioPlayer audioPlayer;
  final DownloadService downloadService;

  OfflinePlayerService(this.audioPlayer, this.downloadService);

  /// Play an offline downloaded item
  Future<void> playOfflineItem(
    DownloadedItem item, {
    bool autoStart = false,
  }) async {
    try {
      if (item.tracks.isEmpty) {
        throw Exception('No tracks found for offline item');
      }

      // Create playlist from downloaded tracks
      final playlist = item.tracks.map((trackPath) {
        final fileName = path.basename(trackPath);
        final trackNumber = _extractTrackNumber(fileName);

        return AudioSource.file(
          trackPath,
          tag: MediaItem(
            id: '${item.id}_$trackNumber',
            album: item.title,
            title: fileName,
            displayDescription: 'Offline',
            extras: {
              'isOffline': true,
              'itemId': item.id,
              'trackPath': trackPath,
            },
          ),
        );
      }).toList();

      // Sort tracks by track number
      playlist.sort((a, b) {
        final aNumber = _extractTrackNumber(a.tag.title ?? '');
        final bNumber = _extractTrackNumber(b.tag.title ?? '');
        return aNumber.compareTo(bNumber);
      });

      // Set the playlist
      await audioPlayer.setAudioSource(
        ConcatenatingAudioSource(children: playlist),
      );

      if (autoStart) {
        await audioPlayer.play();
      }
    } catch (e) {
      debugPrint('Error playing offline item: $e');
      rethrow;
    }
  }

  /// Check if an item is available offline
  Future<bool> isItemAvailableOffline(String itemId) async {
    try {
      final downloadedItems = await downloadService.getDownloadedItems();
      return downloadedItems.any((item) => item.id == itemId);
    } catch (e) {
      debugPrint('Error checking offline availability: $e');
      return false;
    }
  }

  /// Get offline item by ID
  Future<DownloadedItem?> getOfflineItem(String itemId) async {
    try {
      final downloadedItems = await downloadService.getDownloadedItems();
      return downloadedItems.firstWhere(
        (item) => item.id == itemId,
        orElse: () => throw StateError('Item not found'),
      );
    } catch (e) {
      debugPrint('Error getting offline item: $e');
      return null;
    }
  }

  /// Get all offline items
  Future<List<DownloadedItem>> getAllOfflineItems() async {
    try {
      return await downloadService.getDownloadedItems();
    } catch (e) {
      debugPrint('Error getting offline items: $e');
      return [];
    }
  }

  /// Extract track number from filename
  int _extractTrackNumber(String fileName) {
    final regex = RegExp(r'track_(\d+)');
    final match = regex.firstMatch(fileName);
    if (match != null) {
      return int.tryParse(match.group(1) ?? '0') ?? 0;
    }
    return 0;
  }

  /// Get current playing item info
  MediaItem? getCurrentPlayingItem() {
    // For now, return null as we can't access tag from AudioSource
    // This will be implemented when we have proper track management
    return null;
  }

  /// Check if currently playing item is offline
  bool isCurrentlyPlayingOffline() {
    final currentItem = getCurrentPlayingItem();
    return currentItem?.extras?['isOffline'] == true;
  }

  /// Get offline progress for an item
  Future<Map<String, dynamic>?> getOfflineProgress(String itemId) async {
    try {
      // This would typically read from a local database
      // For now, return null as we don't have progress tracking yet
      return null;
    } catch (e) {
      debugPrint('Error getting offline progress: $e');
      return null;
    }
  }

  /// Save offline progress for an item
  Future<void> saveOfflineProgress(
    String itemId,
    Map<String, dynamic> progress,
  ) async {
    try {
      // This would typically save to a local database
      // For now, do nothing as we don't have progress tracking yet
      debugPrint('Saving offline progress for $itemId: $progress');
    } catch (e) {
      debugPrint('Error saving offline progress: $e');
    }
  }
}
