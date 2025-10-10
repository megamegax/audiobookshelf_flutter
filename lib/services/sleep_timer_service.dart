import 'dart:async';
import 'dart:developer' as dev;
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:flutter/foundation.dart';

class SleepTimerService {
  Timer? _timer;
  Timer? _fadeOutTimer;
  Duration? _remainingTime;
  Duration? _totalDuration;
  bool _fadeOutEnabled = false;
  bool _waitForChapterEnd = false;
  final StreamController<Duration?> _remainingTimeController =
      StreamController<Duration?>.broadcast();
  final StreamController<bool> _isActiveController =
      StreamController<bool>.broadcast();

  // Getters
  bool get isActive => _timer?.isActive ?? false;
  Duration? get remainingTime => _remainingTime;
  Duration? get totalDuration => _totalDuration;
  bool get fadeOutEnabled => _fadeOutEnabled;
  bool get waitForChapterEnd => _waitForChapterEnd;

  // Streams
  Stream<Duration?> get remainingTimeStream => _remainingTimeController.stream;
  Stream<bool> get isActiveStream => _isActiveController.stream;

  /// Start the sleep timer
  void startTimer(
    Duration duration, {
    bool fadeOut = false,
    bool waitForChapterEnd = false,
    required PlayerService playerService,
  }) {
    if (kDebugMode) {
      dev.log('[SLEEP_TIMER] Starting timer for ${duration.inMinutes} minutes');
      dev.log(
          '[SLEEP_TIMER] Fade out: $fadeOut, Wait for chapter end: $waitForChapterEnd');
    }

    // Cancel any existing timer
    cancelTimer();

    _totalDuration = duration;
    _remainingTime = duration;
    _fadeOutEnabled = fadeOut;
    _waitForChapterEnd = waitForChapterEnd;

    // Start the countdown timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime != null) {
        _remainingTime = Duration(seconds: _remainingTime!.inSeconds - 1);
        _remainingTimeController.add(_remainingTime);
        _isActiveController.add(true);

        if (_remainingTime!.inSeconds <= 0) {
          _handleTimerExpired(playerService);
        }
      }
    });

    // Update MediaItem once when timer starts (not every second)
    playerService.updateMediaItemInfo(sleepTimerRemaining: _remainingTime);

    if (kDebugMode) {
      dev.log('[SLEEP_TIMER] Timer started successfully');
    }
  }

  /// Cancel the sleep timer
  void cancelTimer({PlayerService? playerService}) {
    if (kDebugMode) {
      dev.log('[SLEEP_TIMER] Cancelling timer');
    }

    _timer?.cancel();
    _fadeOutTimer?.cancel();
    _timer = null;
    _fadeOutTimer = null;
    _remainingTime = null;
    _totalDuration = null;
    _fadeOutEnabled = false;
    _waitForChapterEnd = false;

    _remainingTimeController.add(null);
    _isActiveController.add(false);

    // Clear MediaItem sleep timer info
    if (playerService != null) {
      playerService.updateMediaItemInfo(sleepTimerRemaining: null);
    }

    if (kDebugMode) {
      dev.log('[SLEEP_TIMER] Timer cancelled');
    }
  }

  /// Handle timer expiration
  Future<void> _handleTimerExpired(PlayerService playerService) async {
    if (kDebugMode) {
      dev.log('[SLEEP_TIMER] Timer expired');
    }

    _timer?.cancel();
    _timer = null;

    if (_waitForChapterEnd) {
      await _waitUntilChapterEnd(playerService);
    } else if (_fadeOutEnabled) {
      await _startFadeOut(playerService);
    } else {
      await _stopPlayback(playerService);
    }

    // Reset state
    _remainingTime = null;
    _totalDuration = null;
    _fadeOutEnabled = false;
    _waitForChapterEnd = false;

    _remainingTimeController.add(null);
    _isActiveController.add(false);
  }

  /// Start fade out effect
  Future<void> _startFadeOut(PlayerService playerService) async {
    if (kDebugMode) {
      dev.log('[SLEEP_TIMER] Starting fade out');
    }

    const fadeSteps = 30; // 30 steps over 30 seconds = 1 second per step
    const stepDuration = Duration(seconds: 1);

    double currentVolume = 1.0;
    const volumeStep = 1.0 / fadeSteps;

    _fadeOutTimer = Timer.periodic(stepDuration, (timer) async {
      currentVolume -= volumeStep;
      if (currentVolume <= 0.0) {
        currentVolume = 0.0;
        timer.cancel();
        await _stopPlayback(playerService);
      }

      try {
        await playerService.setVolume(currentVolume);
        if (kDebugMode) {
          dev.log(
              '[SLEEP_TIMER] Fade out volume: ${(currentVolume * 100).toStringAsFixed(1)}%');
        }
      } catch (e) {
        if (kDebugMode) {
          dev.log('[SLEEP_TIMER] Error setting volume during fade out: $e');
        }
      }
    });
  }

  /// Wait until chapter end
  Future<void> _waitUntilChapterEnd(PlayerService playerService) async {
    if (kDebugMode) {
      dev.log('[SLEEP_TIMER] Waiting for chapter end');
    }

    try {
      // Get current track info
      final currentTrack = playerService.currentTrack();
      if (currentTrack == null) {
        if (kDebugMode) {
          dev.log('[SLEEP_TIMER] No current track, stopping immediately');
        }
        await _stopPlayback(playerService);
        return;
      }

      final currentPosition = playerService.playerCurrentPosition();
      final trackDuration = currentTrack.duration ?? 0;
      final remainingInTrack = trackDuration - currentPosition;

      if (kDebugMode) {
        dev.log('[SLEEP_TIMER] Current position: ${currentPosition}s');
        dev.log('[SLEEP_TIMER] Track duration: ${trackDuration}s');
        dev.log('[SLEEP_TIMER] Remaining in track: ${remainingInTrack}s');
      }

      // If less than 2 minutes remaining, wait for chapter end
      if (remainingInTrack <= 120) {
        // 2 minutes
        if (kDebugMode) {
          dev.log(
              '[SLEEP_TIMER] Less than 2 minutes remaining, waiting for chapter end');
        }

        // Wait for the track to finish
        await Future.delayed(Duration(seconds: remainingInTrack.ceil()));
        await _stopPlayback(playerService);
      } else {
        if (kDebugMode) {
          dev.log(
              '[SLEEP_TIMER] More than 2 minutes remaining, stopping immediately');
        }
        await _stopPlayback(playerService);
      }
    } catch (e) {
      if (kDebugMode) {
        dev.log('[SLEEP_TIMER] Error waiting for chapter end: $e');
      }
      // Fallback: stop immediately
      await _stopPlayback(playerService);
    }
  }

  /// Stop playback
  Future<void> _stopPlayback(PlayerService playerService) async {
    if (kDebugMode) {
      dev.log('[SLEEP_TIMER] Stopping playback');
    }

    try {
      await playerService.audioPlayer.stop();
      if (kDebugMode) {
        dev.log('[SLEEP_TIMER] Playback stopped successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        dev.log('[SLEEP_TIMER] Error stopping playback: $e');
      }
    }
  }

  /// Dispose resources
  void dispose() {
    cancelTimer();
    _remainingTimeController.close();
    _isActiveController.close();
  }
}
