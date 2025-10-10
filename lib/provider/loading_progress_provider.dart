import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/services/loading_progress_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_progress_provider.g.dart';

/// State notifier for managing loading progress
@riverpod
class LoadingProgressNotifier extends _$LoadingProgressNotifier {
  @override
  LoadingProgressState build() {
    return const LoadingProgressState.initial();
  }

  /// Starts loading with progress tracking for a library
  Future<void> startLoading(Library library) async {
    final userModel = ref.read(userModelProvider);
    if (userModel == null) {
      state = const LoadingProgressState.error('User not logged in');
      return;
    }

    state = LoadingProgressState.loading(library.id, library.name);

    try {
      final progressService = ref.read(loadingProgressServiceProvider);
      await progressService.startLoadingWithProgress(userModel, library);

      // Check final status
      if (progressService.isCompleted(library.id)) {
        state = LoadingProgressState.completed(library.id, library.name);
      } else if (progressService.hasError(library.id)) {
        final progress = progressService.getProgress(library.id);
        state = LoadingProgressState.error(
          progress?.currentStep ?? 'Unknown error',
        );
      }
    } catch (e) {
      state = LoadingProgressState.error('Failed to start loading: $e');
    }
  }

  /// Gets current progress for a library
  LoadingProgress? getProgress(String libraryId) {
    final progressService = ref.read(loadingProgressServiceProvider);
    return progressService.getProgress(libraryId);
  }

  /// Gets progress stream for a library
  Stream<LoadingProgress>? getProgressStream(String libraryId) {
    final progressService = ref.read(loadingProgressServiceProvider);
    return progressService.getProgressStream(libraryId);
  }

  /// Checks if a library is currently loading
  bool isLoading(String libraryId) {
    final progressService = ref.read(loadingProgressServiceProvider);
    return progressService.isLoading(libraryId);
  }

  /// Checks if a library has completed loading
  bool isCompleted(String libraryId) {
    final progressService = ref.read(loadingProgressServiceProvider);
    return progressService.isCompleted(libraryId);
  }

  /// Checks if a library encountered an error
  bool hasError(String libraryId) {
    final progressService = ref.read(loadingProgressServiceProvider);
    return progressService.hasError(libraryId);
  }

  /// Gets loading duration for a library
  Duration? getLoadingDuration(String libraryId) {
    final progressService = ref.read(loadingProgressServiceProvider);
    return progressService.getLoadingDuration(libraryId);
  }

  /// Clears progress for a library
  void clearProgress(String libraryId) {
    final progressService = ref.read(loadingProgressServiceProvider);
    progressService.clearProgress(libraryId);
    state = const LoadingProgressState.initial();
  }

  /// Clears all progress
  void clearAllProgress() {
    final progressService = ref.read(loadingProgressServiceProvider);
    progressService.clearAllProgress();
    state = const LoadingProgressState.initial();
  }

  /// Resets the state
  void reset() {
    state = const LoadingProgressState.initial();
  }
}

/// State for loading progress operations
sealed class LoadingProgressState {
  const LoadingProgressState();

  const factory LoadingProgressState.initial() = _Initial;
  const factory LoadingProgressState.loading(
    String libraryId,
    String libraryName,
  ) = _Loading;
  const factory LoadingProgressState.completed(
    String libraryId,
    String libraryName,
  ) = _Completed;
  const factory LoadingProgressState.error(String message) = _Error;
}

class _Initial extends LoadingProgressState {
  const _Initial();
}

class _Loading extends LoadingProgressState {
  final String libraryId;
  final String libraryName;
  const _Loading(this.libraryId, this.libraryName);
}

class _Completed extends LoadingProgressState {
  final String libraryId;
  final String libraryName;
  const _Completed(this.libraryId, this.libraryName);
}

class _Error extends LoadingProgressState {
  final String message;
  const _Error(this.message);
}
