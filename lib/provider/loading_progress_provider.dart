import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/services/loading_progress_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for loading progress state management
final loadingProgressProvider =
    StateNotifierProvider<LoadingProgressNotifier, LoadingProgressState>((ref) {
  return LoadingProgressNotifier(ref);
});

/// State notifier for managing loading progress
class LoadingProgressNotifier extends StateNotifier<LoadingProgressState> {
  final Ref _ref;
  final LoadingProgressService _progressService;

  LoadingProgressNotifier(this._ref)
      : _progressService = _ref.read(loadingProgressServiceProvider),
        super(const LoadingProgressState.initial());

  /// Starts loading with progress tracking for a library
  Future<void> startLoading(Library library) async {
    final userModel = _ref.read(userModelNotifierProvider);
    if (userModel == null) {
      state = const LoadingProgressState.error('User not logged in');
      return;
    }

    state = LoadingProgressState.loading(library.id, library.name);

    try {
      await _progressService.startLoadingWithProgress(userModel, library);

      // Check final status
      if (_progressService.isCompleted(library.id)) {
        state = LoadingProgressState.completed(library.id, library.name);
      } else if (_progressService.hasError(library.id)) {
        final progress = _progressService.getProgress(library.id);
        state = LoadingProgressState.error(
            progress?.currentStep ?? 'Unknown error');
      }
    } catch (e) {
      state = LoadingProgressState.error('Failed to start loading: $e');
    }
  }

  /// Gets current progress for a library
  LoadingProgress? getProgress(String libraryId) {
    return _progressService.getProgress(libraryId);
  }

  /// Gets progress stream for a library
  Stream<LoadingProgress>? getProgressStream(String libraryId) {
    return _progressService.getProgressStream(libraryId);
  }

  /// Checks if a library is currently loading
  bool isLoading(String libraryId) {
    return _progressService.isLoading(libraryId);
  }

  /// Checks if a library has completed loading
  bool isCompleted(String libraryId) {
    return _progressService.isCompleted(libraryId);
  }

  /// Checks if a library encountered an error
  bool hasError(String libraryId) {
    return _progressService.hasError(libraryId);
  }

  /// Gets loading duration for a library
  Duration? getLoadingDuration(String libraryId) {
    return _progressService.getLoadingDuration(libraryId);
  }

  /// Clears progress for a library
  void clearProgress(String libraryId) {
    _progressService.clearProgress(libraryId);
    state = const LoadingProgressState.initial();
  }

  /// Clears all progress
  void clearAllProgress() {
    _progressService.clearAllProgress();
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
      String libraryId, String libraryName) = _Loading;
  const factory LoadingProgressState.completed(
      String libraryId, String libraryName) = _Completed;
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
