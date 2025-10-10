import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/services/loading_progress_service.dart';
import 'package:audiobookshelf_flutter/services/optimized_background_loading_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'optimized_background_loading_provider.g.dart';

/// State notifier for managing optimized background loading
@riverpod
class OptimizedBackgroundLoadingNotifier
    extends _$OptimizedBackgroundLoadingNotifier {
  @override
  OptimizedBackgroundLoadingState build() {
    return const OptimizedBackgroundLoadingState.initial();
  }

  /// Starts optimized background loading for all libraries
  Future<void> startBackgroundLoading(
    List<Library> libraries,
    String selectedLibraryId,
  ) async {
    final userModel = ref.read(userModelProvider);
    if (userModel == null) {
      state = const OptimizedBackgroundLoadingState.error('User not logged in');
      return;
    }

    if (libraries.isEmpty) {
      state = const OptimizedBackgroundLoadingState.error(
        'No libraries available',
      );
      return;
    }

    state = const OptimizedBackgroundLoadingState.loading();

    try {
      final loadingService = ref.read(
        optimizedBackgroundLoadingServiceProvider,
      );
      await loadingService.loadAllLibrariesInBackground(
        userModel,
        libraries,
        selectedLibraryId,
      );

      // Check if all libraries completed successfully
      final allCompleted = libraries.every(
        (lib) => loadingService.isLibraryLoaded(lib.id),
      );
      final hasErrors = libraries.any(
        (lib) => loadingService.hasLibraryError(lib.id),
      );

      if (allCompleted) {
        state = const OptimizedBackgroundLoadingState.completed();
      } else if (hasErrors) {
        state = const OptimizedBackgroundLoadingState.error(
          'Some libraries failed to load',
        );
      } else {
        // Still loading
        state = const OptimizedBackgroundLoadingState.loading();
      }
    } catch (e) {
      state = OptimizedBackgroundLoadingState.error(
        'Failed to start background loading: $e',
      );
    }
  }

  /// Gets loading progress for a specific library
  LoadingProgress? getLibraryProgress(String libraryId) {
    final loadingService = ref.read(optimizedBackgroundLoadingServiceProvider);
    return loadingService.getLoadingProgress(libraryId);
  }

  /// Gets progress stream for a specific library
  Stream<LoadingProgress>? getLibraryProgressStream(String libraryId) {
    final loadingService = ref.read(optimizedBackgroundLoadingServiceProvider);
    return loadingService.getLoadingProgressStream(libraryId);
  }

  /// Checks if a library is currently loading
  bool isLibraryLoading(String libraryId) {
    final loadingService = ref.read(optimizedBackgroundLoadingServiceProvider);
    return loadingService.isLibraryLoading(libraryId);
  }

  /// Checks if a library has been loaded
  bool isLibraryLoaded(String libraryId) {
    final loadingService = ref.read(optimizedBackgroundLoadingServiceProvider);
    return loadingService.isLibraryLoaded(libraryId);
  }

  /// Checks if a library encountered an error
  bool hasLibraryError(String libraryId) {
    final loadingService = ref.read(optimizedBackgroundLoadingServiceProvider);
    return loadingService.hasLibraryError(libraryId);
  }

  /// Gets loading duration for a library
  Duration? getLibraryLoadingDuration(String libraryId) {
    final loadingService = ref.read(optimizedBackgroundLoadingServiceProvider);
    return loadingService.getLoadingDuration(libraryId);
  }

  /// Gets the number of libraries currently loading
  int get loadingLibrariesCount {
    final loadingService = ref.read(optimizedBackgroundLoadingServiceProvider);
    return loadingService.loadingLibrariesCount;
  }

  /// Gets the list of library IDs currently loading
  List<String> get loadingLibraryIds {
    final loadingService = ref.read(optimizedBackgroundLoadingServiceProvider);
    return loadingService.loadingLibraryIds;
  }

  /// Cancels loading for a specific library
  void cancelLibraryLoading(String libraryId) {
    final loadingService = ref.read(optimizedBackgroundLoadingServiceProvider);
    loadingService.cancelLoading(libraryId);
  }

  /// Cancels all background loading
  void cancelAllLoading() {
    final loadingService = ref.read(optimizedBackgroundLoadingServiceProvider);
    loadingService.cancelAllLoading();
    state = const OptimizedBackgroundLoadingState.cancelled();
  }

  /// Resets the state
  void reset() {
    state = const OptimizedBackgroundLoadingState.initial();
  }
}

/// State of optimized background loading
sealed class OptimizedBackgroundLoadingState {
  const OptimizedBackgroundLoadingState();

  const factory OptimizedBackgroundLoadingState.initial() = _Initial;
  const factory OptimizedBackgroundLoadingState.loading() = _Loading;
  const factory OptimizedBackgroundLoadingState.completed() = _Completed;
  const factory OptimizedBackgroundLoadingState.error(String message) = _Error;
  const factory OptimizedBackgroundLoadingState.cancelled() = _Cancelled;

  /// Checks if the state is loading
  bool get isLoading => this is _Loading;

  /// Checks if the state is completed
  bool get isCompleted => this is _Completed;

  /// Checks if the state has an error
  bool get hasError => this is _Error;

  /// Checks if the state is cancelled
  bool get isCancelled => this is _Cancelled;

  /// Gets the error message if available
  String? get errorMessage {
    return switch (this) {
      _Error(message: final message) => message,
      _ => null,
    };
  }
}

class _Initial extends OptimizedBackgroundLoadingState {
  const _Initial();
}

class _Loading extends OptimizedBackgroundLoadingState {
  const _Loading();
}

class _Completed extends OptimizedBackgroundLoadingState {
  const _Completed();
}

class _Error extends OptimizedBackgroundLoadingState {
  final String message;
  const _Error(this.message);
}

class _Cancelled extends OptimizedBackgroundLoadingState {
  const _Cancelled();
}
