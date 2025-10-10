import 'package:audiobookshelf_flutter/services/download_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'download_provider.g.dart';

// Download progress state
class DownloadProgress {
  final String itemId;
  final double progress;
  final bool isDownloading;
  final String? error;

  const DownloadProgress({
    required this.itemId,
    required this.progress,
    required this.isDownloading,
    this.error,
  });

  DownloadProgress copyWith({
    String? itemId,
    double? progress,
    bool? isDownloading,
    String? error,
  }) {
    return DownloadProgress(
      itemId: itemId ?? this.itemId,
      progress: progress ?? this.progress,
      isDownloading: isDownloading ?? this.isDownloading,
      error: error ?? this.error,
    );
  }
}

// Download state notifier
@riverpod
class DownloadStateNotifier extends _$DownloadStateNotifier {
  @override
  Map<String, DownloadProgress> build() => {};

  void startDownload(String itemId) {
    state = {
      ...state,
      itemId: DownloadProgress(
        itemId: itemId,
        progress: 0.0,
        isDownloading: true,
      ),
    };
  }

  void updateProgress(String itemId, double progress) {
    state = {
      ...state,
      itemId:
          state[itemId]?.copyWith(progress: progress) ??
          DownloadProgress(
            itemId: itemId,
            progress: progress,
            isDownloading: true,
          ),
    };
  }

  void completeDownload(String itemId) {
    state = {
      ...state,
      itemId:
          state[itemId]?.copyWith(progress: 1.0, isDownloading: false) ??
          DownloadProgress(itemId: itemId, progress: 1.0, isDownloading: false),
    };
  }

  void errorDownload(String itemId, String error) {
    state = {
      ...state,
      itemId:
          state[itemId]?.copyWith(isDownloading: false, error: error) ??
          DownloadProgress(
            itemId: itemId,
            progress: 0.0,
            isDownloading: false,
            error: error,
          ),
    };
  }

  void clearDownload(String itemId) {
    final newState = Map<String, DownloadProgress>.from(state);
    newState.remove(itemId);
    state = newState;
  }

  bool isDownloading(String itemId) {
    return state[itemId]?.isDownloading ?? false;
  }

  double getProgress(String itemId) {
    return state[itemId]?.progress ?? 0.0;
  }
}

@riverpod
Future<List<DownloadedItem>> downloadedItems(Ref ref) async {
  final downloadService = ref.watch(downloadServiceProvider);
  return await downloadService.getDownloadedItems();
}
