import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:audiobookshelf_flutter/services/sleep_timer_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_timer_provider.freezed.dart';
part 'sleep_timer_provider.g.dart';

// State for sleep timer
@freezed
sealed class SleepTimerState with _$SleepTimerState {
  const factory SleepTimerState({
    @Default(false) bool isActive,
    Duration? remainingTime,
    Duration? totalDuration,
    @Default(false) bool fadeOutEnabled,
    @Default(false) bool waitForChapterEnd,
  }) = _SleepTimerState;
}

// Provider for SleepTimerService
@riverpod
SleepTimerService sleepTimerService(Ref ref) {
  return SleepTimerService();
}

// Notifier for sleep timer state
@riverpod
class SleepTimerNotifier extends _$SleepTimerNotifier {
  @override
  SleepTimerState build() {
    return const SleepTimerState();
  }

  void startTimer(
    Duration duration, {
    bool fadeOut = false,
    bool waitForChapterEnd = false,
  }) {
    final sleepTimerService = ref.read(sleepTimerServiceProvider);
    final playerService = ref.read(playerServiceProvider);

    sleepTimerService.startTimer(
      duration,
      fadeOut: fadeOut,
      waitForChapterEnd: waitForChapterEnd,
      playerService: playerService,
    );

    state = state.copyWith(
      totalDuration: duration,
      fadeOutEnabled: fadeOut,
      waitForChapterEnd: waitForChapterEnd,
    );
  }

  void cancelTimer() {
    final sleepTimerService = ref.read(sleepTimerServiceProvider);
    final playerService = ref.read(playerServiceProvider);

    sleepTimerService.cancelTimer(playerService: playerService);
    state = const SleepTimerState();
  }
}
