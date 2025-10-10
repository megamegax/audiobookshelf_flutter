import 'dart:async';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:audiobookshelf_flutter/services/sleep_timer_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for SleepTimerService
final sleepTimerServiceProvider = Provider<SleepTimerService>((ref) {
  return SleepTimerService();
});

// State for sleep timer
class SleepTimerState {
  final bool isActive;
  final Duration? remainingTime;
  final Duration? totalDuration;
  final bool fadeOutEnabled;
  final bool waitForChapterEnd;

  const SleepTimerState({
    this.isActive = false,
    this.remainingTime,
    this.totalDuration,
    this.fadeOutEnabled = false,
    this.waitForChapterEnd = false,
  });

  SleepTimerState copyWith({
    bool? isActive,
    Duration? remainingTime,
    Duration? totalDuration,
    bool? fadeOutEnabled,
    bool? waitForChapterEnd,
  }) {
    return SleepTimerState(
      isActive: isActive ?? this.isActive,
      remainingTime: remainingTime ?? this.remainingTime,
      totalDuration: totalDuration ?? this.totalDuration,
      fadeOutEnabled: fadeOutEnabled ?? this.fadeOutEnabled,
      waitForChapterEnd: waitForChapterEnd ?? this.waitForChapterEnd,
    );
  }
}

// Notifier for sleep timer state
class SleepTimerNotifier extends StateNotifier<SleepTimerState> {
  final SleepTimerService _sleepTimerService;
  final PlayerService _playerService;
  StreamSubscription<Duration?>? _remainingTimeSubscription;
  StreamSubscription<bool>? _isActiveSubscription;

  SleepTimerNotifier(this._sleepTimerService, this._playerService)
      : super(const SleepTimerState()) {
    _setupSubscriptions();
  }

  void _setupSubscriptions() {
    _remainingTimeSubscription =
        _sleepTimerService.remainingTimeStream.listen((remainingTime) {
      state = state.copyWith(remainingTime: remainingTime);
    });

    _isActiveSubscription =
        _sleepTimerService.isActiveStream.listen((isActive) {
      state = state.copyWith(isActive: isActive);
    });
  }

  void startTimer(Duration duration,
      {bool fadeOut = false, bool waitForChapterEnd = false}) {
    _sleepTimerService.startTimer(
      duration,
      fadeOut: fadeOut,
      waitForChapterEnd: waitForChapterEnd,
      playerService: _playerService,
    );

    state = state.copyWith(
      totalDuration: duration,
      fadeOutEnabled: fadeOut,
      waitForChapterEnd: waitForChapterEnd,
    );
  }

  void cancelTimer() {
    _sleepTimerService.cancelTimer(playerService: _playerService);
    state = const SleepTimerState();
  }

  @override
  void dispose() {
    _remainingTimeSubscription?.cancel();
    _isActiveSubscription?.cancel();
    _sleepTimerService.dispose();
    super.dispose();
  }
}

// Provider for sleep timer notifier
final sleepTimerProvider =
    StateNotifierProvider<SleepTimerNotifier, SleepTimerState>((ref) {
  final sleepTimerService = ref.read(sleepTimerServiceProvider);
  final playerService = ref.read(playerServiceProvider.notifier);
  return SleepTimerNotifier(sleepTimerService, playerService);
});
