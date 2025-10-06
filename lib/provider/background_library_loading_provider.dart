import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/library_selector_provider.dart';
import 'package:audiobookshelf_flutter/services/background_library_loading_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for background library loading state
final backgroundLibraryLoadingStateProvider = StateNotifierProvider<
    BackgroundLibraryLoadingStateNotifier,
    BackgroundLibraryLoadingState>((ref) {
  return BackgroundLibraryLoadingStateNotifier(ref);
});

class BackgroundLibraryLoadingStateNotifier
    extends StateNotifier<BackgroundLibraryLoadingState> {
  final Ref _ref;
  final BackgroundLibraryLoadingService _loadingService;

  BackgroundLibraryLoadingStateNotifier(this._ref)
      : _loadingService = _ref.read(backgroundLibraryLoadingServiceProvider),
        super(const BackgroundLibraryLoadingState.initial());

  /// Start background loading for all libraries
  Future<void> startBackgroundLoading() async {
    final userModel = _ref.read(userModelNotifierProvider);
    final librariesAsync = _ref.read(availableLibrariesProvider);
    final selectedLibrary = _ref.read(selectedLibraryProvider);

    if (userModel == null || selectedLibrary == null) {
      return;
    }

    librariesAsync.when(
      data: (libraries) async {
        if (libraries.isEmpty) return;

        state = const BackgroundLibraryLoadingState.loading();

        try {
          await _loadingService.loadAllLibrariesInBackground(
            userModel,
            libraries,
            selectedLibrary.id,
          );

          state = const BackgroundLibraryLoadingState.completed();
        } catch (e) {
          state = BackgroundLibraryLoadingState.error(e.toString());
        }
      },
      loading: () {},
      error: (error, stack) {
        state = BackgroundLibraryLoadingState.error(error.toString());
      },
    );
  }

  /// Get loading progress for a specific library
  LibraryLoadingProgress? getLibraryProgress(String libraryId) {
    return _loadingService.getLoadingProgress(libraryId);
  }

  /// Get progress stream for a specific library
  Stream<LibraryLoadingProgress>? getLibraryProgressStream(String libraryId) {
    return _loadingService.getProgressStream(libraryId);
  }

  /// Check if a library is currently loading
  bool isLibraryLoading(String libraryId) {
    return _loadingService.isLibraryLoading(libraryId);
  }

  /// Check if a library has been loaded
  bool isLibraryLoaded(String libraryId) {
    return _loadingService.isLibraryLoaded(libraryId);
  }

  /// Cancel all background loading
  void cancelLoading() {
    _loadingService.cancelAllLoading();
    state = const BackgroundLibraryLoadingState.cancelled();
  }

  /// Reset state
  void reset() {
    state = const BackgroundLibraryLoadingState.initial();
  }
}

/// State of background library loading
sealed class BackgroundLibraryLoadingState {
  const BackgroundLibraryLoadingState();

  const factory BackgroundLibraryLoadingState.initial() = _Initial;
  const factory BackgroundLibraryLoadingState.loading() = _Loading;
  const factory BackgroundLibraryLoadingState.completed() = _Completed;
  const factory BackgroundLibraryLoadingState.error(String message) = _Error;
  const factory BackgroundLibraryLoadingState.cancelled() = _Cancelled;
}

class _Initial extends BackgroundLibraryLoadingState {
  const _Initial();
}

class _Loading extends BackgroundLibraryLoadingState {
  const _Loading();
}

class _Completed extends BackgroundLibraryLoadingState {
  const _Completed();
}

class _Error extends BackgroundLibraryLoadingState {
  final String message;
  const _Error(this.message);
}

class _Cancelled extends BackgroundLibraryLoadingState {
  const _Cancelled();
}
