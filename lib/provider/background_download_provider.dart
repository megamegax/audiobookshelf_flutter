import 'dart:async';
import 'package:audiobookshelf_flutter/services/background_download_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for background download state
final backgroundDownloadStateProvider = StateNotifierProvider<BackgroundDownloadStateNotifier, BackgroundDownloadState>((ref) {
  return BackgroundDownloadStateNotifier(ref.watch(backgroundDownloadServiceProvider));
});

/// Background download state
class BackgroundDownloadState {
  final Map<String, DownloadTask> activeDownloads;
  final int totalDownloads;
  final int completedDownloads;
  final int failedDownloads;
  final bool isDownloading;

  const BackgroundDownloadState({
    this.activeDownloads = const {},
    this.totalDownloads = 0,
    this.completedDownloads = 0,
    this.failedDownloads = 0,
    this.isDownloading = false,
  });

  BackgroundDownloadState copyWith({
    Map<String, DownloadTask>? activeDownloads,
    int? totalDownloads,
    int? completedDownloads,
    int? failedDownloads,
    bool? isDownloading,
  }) {
    return BackgroundDownloadState(
      activeDownloads: activeDownloads ?? this.activeDownloads,
      totalDownloads: totalDownloads ?? this.totalDownloads,
      completedDownloads: completedDownloads ?? this.completedDownloads,
      failedDownloads: failedDownloads ?? this.failedDownloads,
      isDownloading: isDownloading ?? this.isDownloading,
    );
  }
}

/// Background download state notifier
class BackgroundDownloadStateNotifier extends StateNotifier<BackgroundDownloadState> {
  final BackgroundDownloadService _backgroundDownloadService;
  StreamSubscription<DownloadProgress>? _progressSubscription;

  BackgroundDownloadStateNotifier(this._backgroundDownloadService) : super(const BackgroundDownloadState()) {
    _initializeProgressListener();
  }

  void _initializeProgressListener() {
    _progressSubscription = _backgroundDownloadService.progressStream.listen((progress) {
      _updateDownloadProgress(progress);
    });
  }

  void _updateDownloadProgress(DownloadProgress progress) {
    final currentDownloads = Map<String, DownloadTask>.from(state.activeDownloads);
    currentDownloads[progress.taskId] = progress.task;

    // Calculate statistics
    final totalDownloads = currentDownloads.length;
    final completedDownloads = currentDownloads.values.where((task) => task.status == DownloadStatus.completed).length;
    final failedDownloads = currentDownloads.values.where((task) => task.status == DownloadStatus.failed).length;
    final isDownloading = currentDownloads.values.any((task) => 
        task.status == DownloadStatus.downloading || task.status == DownloadStatus.queued);

    state = state.copyWith(
      activeDownloads: currentDownloads,
      totalDownloads: totalDownloads,
      completedDownloads: completedDownloads,
      failedDownloads: failedDownloads,
      isDownloading: isDownloading,
    );
  }

  /// Get download progress for a specific library item
  Map<String, DownloadTask> getDownloadsForItem(String libraryItemId) {
    return state.activeDownloads.entries
        .where((entry) => entry.value.libraryItemId == libraryItemId)
        .fold<Map<String, DownloadTask>>({}, (map, entry) {
          map[entry.key] = entry.value;
          return map;
        });
  }

  /// Check if an item is being downloaded
  bool isItemDownloading(String libraryItemId) {
    return state.activeDownloads.values.any((task) => 
        task.libraryItemId == libraryItemId && 
        (task.status == DownloadStatus.downloading || task.status == DownloadStatus.queued));
  }

  /// Get overall progress for an item
  double getItemProgress(String libraryItemId) {
    final itemDownloads = getDownloadsForItem(libraryItemId);
    if (itemDownloads.isEmpty) return 0.0;

    final totalProgress = itemDownloads.values.fold<double>(0.0, (sum, task) => sum + task.progress);
    return totalProgress / itemDownloads.length;
  }

  /// Cancel download for a specific item
  Future<void> cancelItemDownload(String libraryItemId) async {
    final itemDownloads = getDownloadsForItem(libraryItemId);
    for (final taskId in itemDownloads.keys) {
      await _backgroundDownloadService.cancelDownload(taskId);
    }
  }

  /// Pause download for a specific item
  Future<void> pauseItemDownload(String libraryItemId) async {
    final itemDownloads = getDownloadsForItem(libraryItemId);
    for (final taskId in itemDownloads.keys) {
      await _backgroundDownloadService.pauseDownload(taskId);
    }
  }

  /// Resume download for a specific item
  Future<void> resumeItemDownload(String libraryItemId) async {
    final itemDownloads = getDownloadsForItem(libraryItemId);
    for (final taskId in itemDownloads.keys) {
      await _backgroundDownloadService.resumeDownload(taskId);
    }
  }

  /// Cancel all downloads
  Future<void> cancelAllDownloads() async {
    await _backgroundDownloadService.cancelAllDownloads();
  }

  @override
  void dispose() {
    _progressSubscription?.cancel();
    super.dispose();
  }
}
