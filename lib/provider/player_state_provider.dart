import 'dart:async';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookshelf_flutter/model/libraries/detailed_library_item.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/audio_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/book_chapter.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/e_book_file.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

// Player state for the overlay
class PlayerOverlayState {
  final double progress;
  final double chapterProgress;
  final bool isChapterMode;
  final Duration currentChapterDuration;
  final Duration position;
  final Duration? duration;

  const PlayerOverlayState({
    this.progress = 0.0,
    this.chapterProgress = 0.0,
    this.isChapterMode = true,
    this.currentChapterDuration = Duration.zero,
    this.position = Duration.zero,
    this.duration,
  });

  PlayerOverlayState copyWith({
    double? progress,
    double? chapterProgress,
    bool? isChapterMode,
    Duration? currentChapterDuration,
    Duration? position,
    Duration? duration,
  }) {
    return PlayerOverlayState(
      progress: progress ?? this.progress,
      chapterProgress: chapterProgress ?? this.chapterProgress,
      isChapterMode: isChapterMode ?? this.isChapterMode,
      currentChapterDuration:
          currentChapterDuration ?? this.currentChapterDuration,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }
}

// Notifier for player overlay state
class PlayerOverlayNotifier extends StateNotifier<PlayerOverlayState> {
  final AudioPlayer audioPlayer;
  final PlayerService playerService;
  final MediaItem mediaItem;
  StreamSubscription? _positionSubscription;

  PlayerOverlayNotifier({
    required this.audioPlayer,
    required this.playerService,
    required this.mediaItem,
  }) : super(const PlayerOverlayState()) {
    _startPositionListener();
  }

  void _startPositionListener() {
    _positionSubscription = audioPlayer.positionStream.listen((position) {
      final duration = audioPlayer.duration;

      // Calculate overall progress
      double progress = 0.0;
      if (duration != null && duration.inSeconds > 0) {
        progress = position.inSeconds / duration.inSeconds;
      }

      // Calculate chapter progress
      double chapterProgress = 0.0;
      Duration currentChapterDuration = Duration.zero;

      final currentTrack = playerService.currentTrack();
      if (currentTrack != null) {
        currentChapterDuration =
            Duration(seconds: currentTrack.duration?.round() ?? 0);
        final trackStartOffset = playerService.currentTrackStartOffset();
        final currentTrackPosition = position.inSeconds - trackStartOffset;

        if (currentChapterDuration.inSeconds > 0) {
          chapterProgress =
              (currentTrackPosition / currentChapterDuration.inSeconds)
                  .clamp(0.0, 1.0);
        }
      }

      state = state.copyWith(
        progress: progress,
        chapterProgress: chapterProgress,
        currentChapterDuration: currentChapterDuration,
        position: position,
        duration: duration,
      );
    });
  }

  void toggleChapterMode() {
    state = state.copyWith(isChapterMode: !state.isChapterMode);
  }

  void seekTo(Duration position) {
    if (state.isChapterMode) {
      final currentTrack = playerService.currentTrack();
      if (currentTrack != null) {
        final trackStartOffset = playerService.currentTrackStartOffset();
        final seekPositionInTrack =
            position.inSeconds + trackStartOffset.round();
        audioPlayer.seek(Duration(seconds: seekPositionInTrack));
      }
    } else {
      audioPlayer.seek(position);
    }
    playerService.updateMediaProgress();
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    super.dispose();
  }
}

// Floating player state
class FloatingPlayerState {
  final bool isPlaying;
  final bool isExpanded;

  const FloatingPlayerState({
    this.isPlaying = false,
    this.isExpanded = false,
  });

  FloatingPlayerState copyWith({
    bool? isPlaying,
    bool? isExpanded,
  }) {
    return FloatingPlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}

// Notifier for floating player state
class FloatingPlayerNotifier extends StateNotifier<FloatingPlayerState> {
  final AudioPlayer audioPlayer;
  StreamSubscription? _playingSubscription;

  FloatingPlayerNotifier({required this.audioPlayer})
      : super(const FloatingPlayerState()) {
    _initializeListeners();
  }

  void _initializeListeners() {
    _playingSubscription = audioPlayer.playingStream.listen((playing) {
      state = state.copyWith(isPlaying: playing);
    });
  }

  void toggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  @override
  void dispose() {
    _playingSubscription?.cancel();
    super.dispose();
  }
}

// Audio position state
class AudioPositionState {
  final Duration position;
  final Duration? duration;
  final double progress;

  const AudioPositionState({
    this.position = Duration.zero,
    this.duration,
    this.progress = 0.0,
  });

  AudioPositionState copyWith({
    Duration? position,
    Duration? duration,
    double? progress,
  }) {
    return AudioPositionState(
      position: position ?? this.position,
      duration: duration ?? this.duration,
      progress: progress ?? this.progress,
    );
  }
}

// Notifier for audio position state
class AudioPositionNotifier extends StateNotifier<AudioPositionState> {
  final AudioPlayer audioPlayer;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _durationSubscription;

  AudioPositionNotifier({required this.audioPlayer})
      : super(const AudioPositionState()) {
    _initializeListeners();
  }

  void _initializeListeners() {
    _positionSubscription = audioPlayer.positionStream.listen((position) {
      final duration = audioPlayer.duration;
      final progress = duration != null && duration.inMilliseconds > 0
          ? position.inMilliseconds / duration.inMilliseconds
          : 0.0;

      state = state.copyWith(
        position: position,
        duration: duration,
        progress: progress,
      );
    });

    _durationSubscription = audioPlayer.durationStream.listen((duration) {
      final position = audioPlayer.position;
      final progress = duration != null && duration.inMilliseconds > 0
          ? position.inMilliseconds / duration.inMilliseconds
          : 0.0;

      state = state.copyWith(
        duration: duration,
        progress: progress,
      );
    });
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    super.dispose();
  }
}

// Provider for audio position state
final audioPositionStateProvider = StateNotifierProvider.family<
    AudioPositionNotifier, AudioPositionState, AudioPlayer>((ref, audioPlayer) {
  return AudioPositionNotifier(audioPlayer: audioPlayer);
});

// Provider for floating player state
final floatingPlayerStateProvider = StateNotifierProvider.family<
    FloatingPlayerNotifier,
    FloatingPlayerState,
    AudioPlayer>((ref, audioPlayer) {
  return FloatingPlayerNotifier(audioPlayer: audioPlayer);
});

// Provider for player overlay state
final playerOverlayStateProvider = StateNotifierProvider.family<
    PlayerOverlayNotifier,
    PlayerOverlayState,
    Map<String, dynamic>>((ref, params) {
  final audioPlayer = params['audioPlayer'] as AudioPlayer;
  final playerService = params['playerService'] as PlayerService;
  final mediaItem = params['mediaItem'] as MediaItem;

  return PlayerOverlayNotifier(
    audioPlayer: audioPlayer,
    playerService: playerService,
    mediaItem: mediaItem,
  );
});

// Book details state
class BookDetailsState {
  final DetailedLibraryItem? bookDetails;
  final List<BookChapter> chapters;
  final List<AudioFile> audioTracks;
  final List<EBookFile> eBookFiles;
  final bool playerPrepared;
  final bool playerLoading;
  final bool isDescriptionExpanded;
  final bool hasActiveAudioSource;

  const BookDetailsState({
    this.bookDetails,
    this.chapters = const [],
    this.audioTracks = const [],
    this.eBookFiles = const [],
    this.playerPrepared = false,
    this.playerLoading = false,
    this.isDescriptionExpanded = false,
    this.hasActiveAudioSource = false,
  });

  BookDetailsState copyWith({
    DetailedLibraryItem? bookDetails,
    List<BookChapter>? chapters,
    List<AudioFile>? audioTracks,
    List<EBookFile>? eBookFiles,
    bool? playerPrepared,
    bool? playerLoading,
    bool? isDescriptionExpanded,
    bool? hasActiveAudioSource,
  }) {
    return BookDetailsState(
      bookDetails: bookDetails ?? this.bookDetails,
      chapters: chapters ?? this.chapters,
      audioTracks: audioTracks ?? this.audioTracks,
      eBookFiles: eBookFiles ?? this.eBookFiles,
      playerPrepared: playerPrepared ?? this.playerPrepared,
      playerLoading: playerLoading ?? this.playerLoading,
      isDescriptionExpanded:
          isDescriptionExpanded ?? this.isDescriptionExpanded,
      hasActiveAudioSource: hasActiveAudioSource ?? this.hasActiveAudioSource,
    );
  }
}

// Notifier for book details state
class BookDetailsNotifier extends StateNotifier<BookDetailsState> {
  final AudioPlayer audioPlayer;
  StreamSubscription? _audioSourceSubscription;

  BookDetailsNotifier({required this.audioPlayer})
      : super(const BookDetailsState()) {
    _initializeListeners();
  }

  void _initializeListeners() {
    // Listen to player state changes to detect when audio source is loaded
    _audioSourceSubscription =
        audioPlayer.playerStateStream.listen((playerState) {
      state =
          state.copyWith(hasActiveAudioSource: audioPlayer.audioSource != null);
    });

    // Set initial state
    state =
        state.copyWith(hasActiveAudioSource: audioPlayer.audioSource != null);
  }

  Future<void> loadBookDetails(
    DetailedLibraryItem item,
    dynamic userModel,
    dynamic libraryService,
  ) async {
    try {
      state = state.copyWith(playerLoading: true);

      final details = await libraryService.fetchDetailedLibraryItem(
        userModel,
        item.id,
      );

      setBookDetails(details);
      state = state.copyWith(playerLoading: false);
    } catch (e) {
      state = state.copyWith(playerLoading: false);
      rethrow;
    }
  }

  void setBookDetails(DetailedLibraryItem details) {
    state = state.copyWith(
      bookDetails: details,
      chapters: details.media.chapters ?? [],
      audioTracks: details.media.audioFiles ?? [],
      eBookFiles:
          details.media.ebookFile != null ? [details.media.ebookFile!] : [],
    );
  }

  void setPlayerState({bool? prepared, bool? loading}) {
    state = state.copyWith(
      playerPrepared: prepared ?? state.playerPrepared,
      playerLoading: loading ?? state.playerLoading,
    );
  }

  void toggleDescription() {
    state = state.copyWith(isDescriptionExpanded: !state.isDescriptionExpanded);
  }

  @override
  void dispose() {
    _audioSourceSubscription?.cancel();
    super.dispose();
  }
}

// Provider for book details state
final bookDetailsStateProvider = StateNotifierProvider.family<
    BookDetailsNotifier, BookDetailsState, AudioPlayer>((ref, audioPlayer) {
  return BookDetailsNotifier(audioPlayer: audioPlayer);
});
