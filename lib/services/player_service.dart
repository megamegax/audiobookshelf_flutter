import 'dart:math';
import 'dart:developer' as dev;
import 'dart:typed_data';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/audio_track.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/playback_session.dart';
import 'package:audiobookshelf_flutter/model/login/media_progress.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_notifier.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'player_service.g.dart';

// Player state for StateNotifier
class PlayerState {
  final double playbackSpeed;
  final bool isPlaying;
  final Duration? position;
  final Duration? duration;

  const PlayerState({
    this.playbackSpeed = 1.0,
    this.isPlaying = false,
    this.position,
    this.duration,
  });

  PlayerState copyWith({
    double? playbackSpeed,
    bool? isPlaying,
    Duration? position,
    Duration? duration,
  }) {
    return PlayerState(
      playbackSpeed: playbackSpeed ?? this.playbackSpeed,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }
}

@Riverpod(keepAlive: true)
PlayerService playerService(Ref ref) {
  final audioPlayerNotifier = ref.read(audioPlayerProvider.notifier);
  final audioPlayer = audioPlayerNotifier.audioPlayer;
  final serverAddress = ref.read(serverAddressProvider);
  final userModel = ref.read(userModelProvider);
  final libraryItemsRepository = ref.read(
    libraryItemsRepositoryProvider.future,
  );

  if (userModel == null) {
    throw Exception('User not logged in');
  }

  return PlayerService(
    audioPlayer: audioPlayer,
    serverAddress: serverAddress,
    libraryService: ref.read(libraryServiceProvider),
    userModel: userModel,
    libraryItemsRepository: libraryItemsRepository,
    audioPlayerNotifier: audioPlayerNotifier,
  );
}

class PlayerService {
  final AudioPlayer audioPlayer;
  PlaybackSession? _playbackSession;
  final LibraryService libraryService;
  final String serverAddress;
  late double _startTime;
  LibraryItemEntity? _libraryItem;
  final UserModel userModel;
  final Future<LibraryItemsRepository> libraryItemsRepository;
  final AudioPlayerNotifier audioPlayerNotifier;

  PlayerState _state = const PlayerState();

  PlayerState get state => _state;

  PlayerService({
    required this.audioPlayer,
    required this.serverAddress,
    required this.libraryService,
    required this.userModel,
    required this.libraryItemsRepository,
    required this.audioPlayerNotifier,
  });
  void init(PlaybackSession playbackSession, double startTime) {
    _playbackSession = playbackSession;
    _startTime = startTime;
  }

  Future<void> preparePlayer(
    LibraryItemEntity libraryItem, {
    bool autoStart = false,
    Function? onPrepared,
  }) async {
    dev.log(
      '[PLAYER_SERVICE] preparePlayer called for: ${libraryItem.media.metadata?.title}',
    );
    dev.log('[PLAYER_SERVICE] autoStart: $autoStart');
    dev.log(
      '[PLAYER_SERVICE] current audioPlayer.playing: ${audioPlayer.playing}',
    );

    _libraryItem = libraryItem;

    // Check if we're already playing this item
    if (audioPlayer.playing && _libraryItem?.itemId == libraryItem.itemId) {
      dev.log('[PLAYER_SERVICE] Already playing this item, calling onPrepared');
      onPrepared?.call();
      return;
    }

    // Stop current playback if different item
    if (audioPlayer.playing) {
      dev.log('[PLAYER_SERVICE] Stopping current playback for different item');
      await audioPlayer.stop();
    }

    final playbackSession = await libraryService.playBook(
      userModel,
      libraryItem,
    );

    dev.log('[PLAYER_SERVICE] Playback session created: ${playbackSession.id}');
    dev.log(
      '[PLAYER_SERVICE] Session current time: ${playbackSession.currentTime}',
    );
    dev.log(
      '[PLAYER_SERVICE] Audio tracks count: ${playbackSession.audioTracks.length}',
    );

    // Use the current time from the playback session, not 0
    final startTime = playbackSession.currentTime;
    init(playbackSession, startTime);

    // Build the correct streaming URL based on the track content
    final currentTrackData = currentTrack();
    if (currentTrackData == null) {
      dev.log(
        '[PLAYER_SERVICE] ERROR: No current track found, cannot create stream URL',
      );
      throw Exception('No audio track available for playback');
    }

    String streamUrl;
    dev.log(
      '[PLAYER_SERVICE] Track contentUrl: ${currentTrackData.contentUrl}',
    );
    dev.log('[PLAYER_SERVICE] Track index: ${currentTrackData.index}');
    dev.log('[PLAYER_SERVICE] Session ID: ${_playbackSession?.id}');
    dev.log('[PLAYER_SERVICE] Play method: ${_playbackSession?.playMethod}');

    // Follow the same logic as the original Audiobookshelf app
    // Check if this is direct play or transcode based on playMethod
    final isDirectPlay =
        _playbackSession?.playMethod == 1; // PlayMethod.DIRECTPLAY = 1
    dev.log('[PLAYER_SERVICE] Is direct play: $isDirectPlay');

    if (isDirectPlay) {
      // Direct play: use session URL with track index
      streamUrl =
          "$serverAddress/public/session/${_playbackSession!.id}/track/${currentTrackData.index}";
      dev.log('[PLAYER_SERVICE] Using direct play session URL: $streamUrl');
    } else {
      // Transcode: use contentUrl (HLS)
      if (currentTrackData.contentUrl?.isNotEmpty == true) {
        if (currentTrackData.contentUrl!.startsWith('http')) {
          // Full URL
          streamUrl = currentTrackData.contentUrl!;
          dev.log(
            '[PLAYER_SERVICE] Using full transcode contentUrl: $streamUrl',
          );
        } else if (currentTrackData.contentUrl!.startsWith('/')) {
          // Relative URL
          streamUrl = "$serverAddress${currentTrackData.contentUrl}";
          dev.log(
            '[PLAYER_SERVICE] Using relative transcode contentUrl: $streamUrl',
          );
        } else {
          // Fallback to session URL
          streamUrl =
              "$serverAddress/public/session/${_playbackSession!.id}/track/${currentTrackData.index}";
          dev.log(
            '[PLAYER_SERVICE] Using fallback transcode session URL: $streamUrl',
          );
        }
      } else {
        // No contentUrl, use session URL
        streamUrl =
            "$serverAddress/public/session/${_playbackSession!.id}/track/${currentTrackData.index}";
        dev.log(
          '[PLAYER_SERVICE] Using transcode session URL (no contentUrl): $streamUrl',
        );
      }
    }

    // Validate URL before using it
    String fullUrl = "$streamUrl?token=${userModel.token}";
    dev.log('[PLAYER_SERVICE] Full streaming URL: $fullUrl');

    // Test URL accessibility
    try {
      final uri = Uri.parse(fullUrl);
      dev.log('[PLAYER_SERVICE] Parsed URI: $uri');
      dev.log('[PLAYER_SERVICE] URI scheme: ${uri.scheme}');
      dev.log('[PLAYER_SERVICE] URI host: ${uri.host}');
      dev.log('[PLAYER_SERVICE] URI port: ${uri.port}');
      dev.log('[PLAYER_SERVICE] URI path: ${uri.path}');
      dev.log('[PLAYER_SERVICE] URI query: ${uri.query}');
    } catch (e) {
      dev.log('[PLAYER_SERVICE] ERROR: Invalid URL format: $e');
      throw Exception('Invalid streaming URL format: $e');
    }

    // Test URL accessibility with HTTP HEAD request
    try {
      dev.log('[PLAYER_SERVICE] Testing URL accessibility...');
      final httpClient = http.Client();
      final response = await httpClient.head(Uri.parse(fullUrl));
      dev.log(
        '[PLAYER_SERVICE] HTTP HEAD response status: ${response.statusCode}',
      );
      dev.log(
        '[PLAYER_SERVICE] HTTP HEAD response headers: ${response.headers}',
      );
      httpClient.close();

      if (response.statusCode != 200) {
        dev.log(
          '[PLAYER_SERVICE] WARNING: URL not accessible (${response.statusCode}), trying alternative method...',
        );
        // Try alternative URL construction
        final alternativeUrl =
            "$serverAddress/api/items/${_libraryItem!.itemId}/play/${currentTrackData.index ?? 1}?token=${userModel.token}";
        dev.log('[PLAYER_SERVICE] Trying alternative URL: $alternativeUrl');

        final altResponse = await httpClient.head(Uri.parse(alternativeUrl));
        if (altResponse.statusCode == 200) {
          dev.log('[PLAYER_SERVICE] Alternative URL works, using it');
          // Update the fullUrl to use the alternative
          fullUrl = alternativeUrl;
        } else {
          dev.log(
            '[PLAYER_SERVICE] Alternative URL also failed: ${altResponse.statusCode}',
          );
        }
      }
    } catch (e) {
      dev.log('[PLAYER_SERVICE] WARNING: URL accessibility test failed: $e');
      // Don't throw here, let the audio player try anyway
    }

    dev.log(
      '[PLAYER_SERVICE] Setting audio source with URL: $streamUrl?token=***',
    );
    // Create the audio source
    final audioSource = AudioSource.uri(
      Uri.parse(fullUrl),
      tag: MediaItem(
        id: libraryItem.itemId.toString(),
        album: libraryItem.media.metadata?.seriesName,
        title: libraryItem.media.metadata?.title ?? "-",
        displayDescription: libraryItem.media.metadata?.authorName ?? "-",
        extras: {
          "coverBytes": Uint8List.fromList(libraryItem.media.coverBytes ?? []),
          "item": libraryItem,
        },
        duration: Duration(seconds: libraryItem.media.duration?.toInt() ?? 0),
      ),
    );

    // Use the AudioPlayerNotifier to set the audio source and update state
    await audioPlayerNotifier.setAudioSource(audioSource, item: libraryItem);

    dev.log('[PLAYER_SERVICE] Audio source set successfully');

    // Configure audio player settings
    audioPlayer.setCanUseNetworkResourcesForLiveStreamingWhilePaused(true);

    // Calculate the correct seek position within the current track
    final currentTrackStartOffset = currentTrackData.startOffset ?? 0.0;
    final seekTimeInTrack = max(0, startTime - currentTrackStartOffset);
    final position = Duration(seconds: seekTimeInTrack.floor());

    dev.log(
      '[PLAYER_SERVICE] Track start offset: $currentTrackStartOffset, seek time in track: $seekTimeInTrack',
    );

    dev.log(
      '[PLAYER_SERVICE] Calculated seek position: ${position.inSeconds}s within track',
    );

    // Wait for the audio source to be loaded before seeking
    dev.log('[PLAYER_SERVICE] Loading audio source...');
    try {
      await audioPlayer.load();
      dev.log('[PLAYER_SERVICE] Audio source loaded successfully');
    } catch (e) {
      dev.log('[PLAYER_SERVICE] ERROR: Failed to load audio source: $e');
      throw Exception('Failed to load audio stream: $e');
    }

    try {
      dev.log('[PLAYER_SERVICE] Seeking to position: ${position.inSeconds}s');
      await audioPlayer.seek(position);
      dev.log('[PLAYER_SERVICE] Seek completed successfully');
    } catch (e) {
      dev.log(
        '[PLAYER_SERVICE] WARNING: Seek failed, continuing from start: $e',
      );
      // Continue without seeking if it fails
    }

    // Initialize playback speed from preferences
    await _initializePlaybackSpeed();

    if (autoStart) {
      dev.log('[PLAYER_SERVICE] Auto-starting playback');
      try {
        await audioPlayerNotifier.play();
        dev.log('[PLAYER_SERVICE] Playback started successfully');
      } catch (e) {
        dev.log('[PLAYER_SERVICE] ERROR: Failed to start playback: $e');
        throw Exception('Failed to start playback: $e');
      }
    }

    dev.log('[PLAYER_SERVICE] preparePlayer completed, calling onPrepared');
    onPrepared?.call();
  }

  LibraryItemEntity? currentItem() {
    return _libraryItem;
  }

  int currentTrackIndex() {
    if (_playbackSession == null || _playbackSession!.audioTracks.isEmpty) {
      dev.log('[PLAYER_SERVICE] No audio tracks available');
      return 0;
    }

    final trackIndex = _playbackSession!.audioTracks.indexWhere(
      (t) =>
          (t.startOffset?.floor() ?? 0) <= _startTime &&
          ((t.startOffset ?? 0) + (t.duration ?? 0)).floor() > _startTime,
    );

    // If no track found, use the first track
    final currentTrackIndex = trackIndex >= 0 ? trackIndex : 0;

    dev.log(
      '[PLAYER_SERVICE] Current track index: $currentTrackIndex (startTime: $_startTime)',
    );
    return currentTrackIndex;
  }

  double currentTrackStartOffset() {
    return currentTrack()?.startOffset ?? 0.0;
  }

  int playerCurrentPosition() {
    return audioPlayer.position.inSeconds;
  }

  double overallCurrentTime() {
    return currentTrackStartOffset() + playerCurrentPosition();
  }

  double totalDuration() {
    if (_playbackSession == null) return 0.0;

    var total = 0.0;
    for (var at in _playbackSession!.audioTracks) {
      total += (at.duration ?? 0);
    }

    return total;
  }

  AudioTrack? currentTrack() {
    if (_playbackSession == null) return null;
    final index = currentTrackIndex();
    if (index >= 0 && index < _playbackSession!.audioTracks.length) {
      return _playbackSession!.audioTracks[index];
    }
    dev.log(
      '[PLAYER_SERVICE] Invalid track index: $index, tracks count: ${_playbackSession!.audioTracks.length}',
    );
    return null;
  }

  /// Get the duration of the current track/chapter in seconds
  double currentTrackDuration() {
    return currentTrack()?.duration ?? 0.0;
  }

  /// Get the current chapter title (actual chapter name, not filename)
  String? currentChapterTitle() {
    if (_playbackSession == null) return null;
    
    final currentTime = overallCurrentTime();
    
    // Find the chapter that contains the current time
    for (final chapter in _playbackSession!.chapters) {
      if (currentTime >= chapter.start && currentTime < chapter.end) {
        return chapter.title;
      }
    }
    
    // Fallback to track title if no chapter found
    return currentTrack()?.title;
  }

  /// Seek to a specific time in the audiobook
  Future<void> seekTo(double timeInSeconds) async {
    if (_libraryItem == null) return;

    // Update the start time
    _startTime = timeInSeconds;

    // Find the correct track for this time
    if (_playbackSession == null) return;
    final newTrackIndex = max(
      0,
      _playbackSession!.audioTracks.indexWhere(
        (t) =>
            (t.startOffset?.floor() ?? 0) <= timeInSeconds &&
            ((t.startOffset ?? 0) + (t.duration ?? 0)).floor() > timeInSeconds,
      ),
    );

    // If we need to change tracks, reload the audio source
    if (newTrackIndex != currentTrackIndex()) {
      final currentTrack = _playbackSession!.audioTracks[newTrackIndex];
      String streamUrl;

      // Use the same logic as preparePlayer
      final isDirectPlay = _playbackSession!.playMethod == 1;
      if (isDirectPlay) {
        streamUrl =
            "$serverAddress/public/session/${_playbackSession!.id}/track/${currentTrack.index}";
      } else {
        if (currentTrack.contentUrl?.isNotEmpty == true) {
          if (currentTrack.contentUrl!.startsWith('http')) {
            streamUrl = currentTrack.contentUrl!;
          } else if (currentTrack.contentUrl!.startsWith('/')) {
            streamUrl = "$serverAddress${currentTrack.contentUrl}";
          } else {
            streamUrl =
                "$serverAddress/public/session/${_playbackSession!.id}/track/${currentTrack.index}";
          }
        } else {
          streamUrl =
              "$serverAddress/public/session/${_playbackSession!.id}/track/${currentTrack.index}";
        }
      }

      await audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse("$streamUrl?token=${userModel.token}"),
          tag: MediaItem(
            id: _libraryItem!.itemId.toString(),
            album: _libraryItem!.media.metadata?.seriesName,
            title: _libraryItem!.media.metadata?.title ?? "-",
            displayDescription: _libraryItem!.media.metadata?.authorName ?? "-",
            extras: {
              "coverBytes": Uint8List.fromList(
                _libraryItem!.media.coverBytes ?? [],
              ),
              "item": _libraryItem!,
            },
            duration: Duration(
              seconds: _libraryItem!.media.duration?.toInt() ?? 0,
            ),
          ),
        ),
      );
    }

    // Calculate the seek position within the current track
    final currentTrackStartOffset =
        _playbackSession!.audioTracks[newTrackIndex].startOffset ?? 0.0;
    final seekTimeInTrack = max(0, timeInSeconds - currentTrackStartOffset);
    final position = Duration(seconds: seekTimeInTrack.floor());

    // Wait for the audio source to be loaded before seeking
    await audioPlayer.load();
    await audioPlayer.seek(position);

    // Update the playbook session current time
    _playbackSession = _playbackSession!.copyWith(currentTime: timeInSeconds);
  }

  /// Seek within the current track/chapter (for slider usage)
  Future<void> seekWithinCurrentTrack(double progressRatio) async {
    if (_libraryItem == null) return;

    final currentTrackDur = currentTrackDuration();
    if (currentTrackDur <= 0) return;

    // Calculate the target time within the current track
    final targetTimeInTrack = progressRatio * currentTrackDur;
    final targetOverallTime = currentTrackStartOffset() + targetTimeInTrack;

    dev.log(
      '[PLAYER_SERVICE] Seeking within track: ${progressRatio * 100}% (${targetTimeInTrack}s of ${currentTrackDur}s)',
    );

    // Seek within the current audio source
    await audioPlayer.seek(Duration(seconds: targetTimeInTrack.floor()));

    // Update the playback session current time
    _playbackSession = _playbackSession!.copyWith(
      currentTime: targetOverallTime,
    );
  }

  Future<void> sendProgressSync() async {
    final currentTime = overallCurrentTime();
    final syncData = {
      "currentTime": currentTime,
      "progress": currentTime / _libraryItem!.media.duration!,
      "lastUpdate": DateTime.now().millisecondsSinceEpoch,
    };
    await libraryService.sendProgressSync(
      userModel,
      _playbackSession!.id,
      syncData,
    );
  }

  Future<void> updateMediaProgress() async {
    final currentTime = overallCurrentTime();
    final progress = currentTime / _libraryItem!.media.duration!;
    final now = DateTime.now().millisecondsSinceEpoch;

    // Check if progress is 100% and should be marked as finished
    final shouldMarkAsFinished = progress >= 1.0;

    final updatePayload = {
      "currentTime": currentTime,
      "progress": progress,
      "lastUpdate": now,
      if (shouldMarkAsFinished) "isFinished": true,
      if (shouldMarkAsFinished) "finishedAt": now,
    };

    await libraryService.updateMediaProgress(
      userModel,
      _libraryItem!.itemId,
      updatePayload: updatePayload,
    );

    final List<MediaProgress>? mediaProgress = userModel.mediaProgress?.map((
      MediaProgress element,
    ) {
      MediaProgress? updatedElement;
      if (element.libraryItemId == _libraryItem!.itemId) {
        updatedElement = element.copyWith(
          currentTime: currentTime,
          progress: progress,
          lastUpdate: now,
          isFinished: shouldMarkAsFinished,
          finishedAt: shouldMarkAsFinished ? now : element.finishedAt,
        );
      } else {
        updatedElement = element;
      }
      return updatedElement;
    }).toList();

    final updatedUserModel = userModel.copyWith(mediaProgress: mediaProgress);
    (await libraryItemsRepository).saveMediaProgresses(updatedUserModel);

    // Log when a book is marked as finished
    if (shouldMarkAsFinished) {
      if (kDebugMode) {
        print(
          '[PLAYER_SERVICE] Book marked as finished: ${_libraryItem!.media.metadata?.title}',
        );
      }
    }

    // Progress updates are handled by the AudioPlayerNotifier
  }

  /// Skip forward by specified seconds
  Future<void> skipForward(int seconds) async {
    final currentPosition = audioPlayer.position.inSeconds;
    final newPosition = currentPosition + seconds;
    final currentTrackDur = currentTrackDuration();

    dev.log(
      '[PLAYER_SERVICE] Skip forward ${seconds}s: ${currentPosition}s -> ${newPosition}s',
    );

    if (newPosition < currentTrackDur) {
      // Stay within current track
      await audioPlayer.seek(Duration(seconds: newPosition));
    } else {
      // Skip to next chapter if available
      await nextChapter();
    }
    updateMediaProgress();
  }

  /// Skip backward by specified seconds
  Future<void> skipBackward(int seconds) async {
    final currentPosition = audioPlayer.position.inSeconds;
    final newPosition = currentPosition - seconds;

    dev.log(
      '[PLAYER_SERVICE] Skip backward ${seconds}s: ${currentPosition}s -> ${newPosition}s',
    );

    if (newPosition >= 0) {
      // Stay within current track
      await audioPlayer.seek(Duration(seconds: newPosition));
    } else {
      // Skip to previous chapter if available
      await previousChapter();
    }
    updateMediaProgress();
  }

  /// Navigate to next chapter/track
  Future<void> nextChapter() async {
    if (_playbackSession == null) return;
    final currentIndex = currentTrackIndex();
    final nextIndex = currentIndex + 1;

    dev.log('[PLAYER_SERVICE] Next chapter: $currentIndex -> $nextIndex');

    if (nextIndex < _playbackSession!.audioTracks.length) {
      final nextTrack = _playbackSession!.audioTracks[nextIndex];
      final startTime = nextTrack.startOffset ?? 0.0;

      dev.log(
        '[PLAYER_SERVICE] Switching to track $nextIndex at offset ${startTime}s',
      );
      await seekTo(startTime);
    } else {
      dev.log('[PLAYER_SERVICE] Already at last chapter');
    }
  }

  /// Navigate to previous chapter/track
  Future<void> previousChapter() async {
    if (_playbackSession == null) return;
    final currentIndex = currentTrackIndex();
    final currentPosition = audioPlayer.position.inSeconds;

    dev.log(
      '[PLAYER_SERVICE] Previous chapter: current track $currentIndex, position ${currentPosition}s',
    );

    // If we're more than 3 seconds into the track, restart current track
    if (currentPosition > 3) {
      dev.log('[PLAYER_SERVICE] Restarting current track');
      await audioPlayer.seek(Duration.zero);
    } else if (currentIndex > 0) {
      // Go to previous track
      final previousIndex = currentIndex - 1;
      final previousTrack = _playbackSession!.audioTracks[previousIndex];
      final startTime = previousTrack.startOffset ?? 0.0;

      dev.log(
        '[PLAYER_SERVICE] Switching to previous track $previousIndex at offset ${startTime}s',
      );
      await seekTo(startTime);
    } else {
      dev.log('[PLAYER_SERVICE] Already at first chapter, restarting');
      await audioPlayer.seek(Duration.zero);
    }
  }

  /// Check if next chapter is available
  bool hasNextChapter() {
    if (_playbackSession == null) return false;
    return currentTrackIndex() < _playbackSession!.audioTracks.length - 1;
  }

  /// Check if previous chapter is available
  bool hasPreviousChapter() {
    if (_playbackSession == null) return false;
    return currentTrackIndex() > 0 || audioPlayer.position.inSeconds > 3;
  }

  /// Get current playback speed
  double get playbackSpeed => _state.playbackSpeed;

  /// Set playback speed
  Future<void> setPlaybackSpeed(double speed) async {
    if (kDebugMode) {
      dev.log('[PLAYER_SERVICE] Setting playback speed to ${speed}x');
    }

    // Update state to notify listeners
    _state = _state.copyWith(playbackSpeed: speed);

    await audioPlayer.setSpeed(speed);

    // Save to user preferences
    await _savePlaybackSpeed(speed);

    // Update MediaItem with playback speed info
    await updateMediaItemInfo(playbackSpeed: speed);
  }

  /// Set volume (for fade out effect)
  Future<void> setVolume(double volume) async {
    if (kDebugMode) {
      dev.log(
        '[PLAYER_SERVICE] Setting volume to ${(volume * 100).toStringAsFixed(1)}%',
      );
    }
    await audioPlayer.setVolume(volume);
  }

  /// Save playback speed to preferences
  Future<void> _savePlaybackSpeed(double speed) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('playback_speed', speed);

      // Also save per-book speed if we have a current item
      if (_libraryItem != null) {
        await prefs.setDouble('playback_speed_${_libraryItem!.itemId}', speed);
      }
    } catch (e) {
      if (kDebugMode) {
        dev.log('[PLAYER_SERVICE] Error saving playback speed: $e');
      }
    }
  }

  /// Load playback speed from preferences
  Future<double> _loadPlaybackSpeed() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Try to load per-book speed first
      if (_libraryItem != null) {
        final bookSpeed = prefs.getDouble(
          'playback_speed_${_libraryItem!.itemId}',
        );
        if (bookSpeed != null) {
          return bookSpeed;
        }
      }

      // Fall back to global speed
      return prefs.getDouble('playback_speed') ?? 1.0;
    } catch (e) {
      if (kDebugMode) {
        dev.log('[PLAYER_SERVICE] Error loading playback speed: $e');
      }
      return 1.0;
    }
  }

  /// Initialize playback speed when preparing player
  Future<void> _initializePlaybackSpeed() async {
    final savedSpeed = await _loadPlaybackSpeed();
    if (savedSpeed != _state.playbackSpeed) {
      await setPlaybackSpeed(savedSpeed);
    }
  }

  /// Update MediaItem with current sleep timer and playback speed info
  Future<void> updateMediaItemInfo({
    Duration? sleepTimerRemaining,
    double? playbackSpeed,
  }) async {
    if (_libraryItem == null) return;

    try {
      final extras = <String, dynamic>{
        "coverBytes": Uint8List.fromList(_libraryItem!.media.coverBytes ?? []),
        "item": _libraryItem!,
      };

      // Add sleep timer info if provided
      if (sleepTimerRemaining != null) {
        extras["sleepTimerRemaining"] = sleepTimerRemaining.inMinutes;
      }

      // Add playback speed info if provided
      if (playbackSpeed != null) {
        extras["playbackSpeed"] = playbackSpeed;
      }

      final mediaItem = MediaItem(
        id: _libraryItem!.itemId.toString(),
        album: _libraryItem!.media.metadata?.seriesName,
        title: _libraryItem!.media.metadata?.title ?? "-",
        displayDescription: _libraryItem!.media.metadata?.authorName ?? "-",
        extras: extras,
        duration: Duration(seconds: _libraryItem!.media.duration?.toInt() ?? 0),
      );

      // Get current audio source URI
      final currentSource = audioPlayer.audioSource;
      if (currentSource is UriAudioSource) {
        // Only update if the MediaItem actually changed to avoid unnecessary rebuilds
        final currentMediaItem = currentSource.tag as MediaItem?;
        if (currentMediaItem == null ||
            currentMediaItem.extras?["sleepTimerRemaining"] !=
                extras["sleepTimerRemaining"] ||
            currentMediaItem.extras?["playbackSpeed"] !=
                extras["playbackSpeed"]) {
          await audioPlayer.setAudioSource(
            AudioSource.uri(currentSource.uri, tag: mediaItem),
          );
        }
      }

      if (kDebugMode) {
        dev.log(
          '[PLAYER_SERVICE] Updated MediaItem with sleep timer: ${sleepTimerRemaining?.inMinutes}min, speed: ${playbackSpeed}x',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        dev.log('[PLAYER_SERVICE] Error updating MediaItem: $e');
      }
    }
  }
}
