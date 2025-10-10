import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookProgressState {
  final String itemId;
  final double progress; // 0.0 to 1.0
  final double currentTime; // in seconds
  final double duration; // in seconds
  final bool isFinished;
  final bool isPlaying;

  const BookProgressState({
    required this.itemId,
    this.progress = 0.0,
    this.currentTime = 0.0,
    this.duration = 0.0,
    this.isFinished = false,
    this.isPlaying = false,
  });

  BookProgressState copyWith({
    String? itemId,
    double? progress,
    double? currentTime,
    double? duration,
    bool? isFinished,
    bool? isPlaying,
  }) {
    return BookProgressState(
      itemId: itemId ?? this.itemId,
      progress: progress ?? this.progress,
      currentTime: currentTime ?? this.currentTime,
      duration: duration ?? this.duration,
      isFinished: isFinished ?? this.isFinished,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

class BookProgressNotifier extends StateNotifier<BookProgressState?> {
  BookProgressNotifier() : super(null);

  void updateProgress({
    required String itemId,
    double? progress,
    double? currentTime,
    double? duration,
    bool? isFinished,
    bool? isPlaying,
  }) {
    if (state?.itemId == itemId) {
      // Update existing state
      state = state!.copyWith(
        progress: progress,
        currentTime: currentTime,
        duration: duration,
        isFinished: isFinished,
        isPlaying: isPlaying,
      );
    } else {
      // Create new state
      state = BookProgressState(
        itemId: itemId,
        progress: progress ?? 0.0,
        currentTime: currentTime ?? 0.0,
        duration: duration ?? 0.0,
        isFinished: isFinished ?? false,
        isPlaying: isPlaying ?? false,
      );
    }
  }

  void clearProgress() {
    state = null;
  }
}

final bookProgressProvider =
    StateNotifierProvider<BookProgressNotifier, BookProgressState?>((ref) {
  return BookProgressNotifier();
});
