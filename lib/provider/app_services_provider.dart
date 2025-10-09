import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/provider/cover_image_provider.dart';
import 'package:audiobookshelf_flutter/provider/loading_progress_provider.dart';
import 'package:audiobookshelf_flutter/provider/optimized_background_loading_provider.dart';
import 'package:audiobookshelf_flutter/services/cover_image_service.dart';
import 'package:audiobookshelf_flutter/services/incremental_sync_service.dart';
import 'package:audiobookshelf_flutter/services/loading_progress_service.dart';
import 'package:audiobookshelf_flutter/services/optimized_background_loading_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Central provider that manages all app services
/// This provides a clean interface for accessing all services throughout the app
class AppServices {
  final CoverImageService coverImageService;
  final IncrementalSyncService incrementalSyncService;
  final LoadingProgressService loadingProgressService;
  final OptimizedBackgroundLoadingService backgroundLoadingService;

  AppServices({
    required this.coverImageService,
    required this.incrementalSyncService,
    required this.loadingProgressService,
    required this.backgroundLoadingService,
  });
}

/// Provider for the main app services
final appServicesProvider = Provider<AppServices>((ref) {
  return AppServices(
    coverImageService: ref.watch(coverImageServiceProvider),
    incrementalSyncService: ref.watch(incrementalSyncServiceProvider),
    loadingProgressService: ref.watch(loadingProgressServiceProvider),
    backgroundLoadingService:
        ref.watch(optimizedBackgroundLoadingServiceProvider),
  );
});

/// Provider for cover image operations
final coverImageOperationsProvider = Provider<CoverImageOperations>((ref) {
  return CoverImageOperations(ref);
});

/// Provider for loading operations
final loadingOperationsProvider = Provider<LoadingOperations>((ref) {
  return LoadingOperations(ref);
});

/// Provider for sync operations
final syncOperationsProvider = Provider<SyncOperations>((ref) {
  return SyncOperations(ref);
});

/// Wrapper class for cover image operations
class CoverImageOperations {
  final Ref _ref;

  CoverImageOperations(this._ref);

  /// Downloads cover for a library item
  Future<void> downloadCover(dynamic item) async {
    await _ref.read(coverImageProvider.notifier).downloadCoverForItem(item);
  }

  /// Checks if cover is cached
  Future<bool> isCoverCached(String itemId) async {
    return await _ref.read(coverImageProvider.notifier).isCoverCached(itemId);
  }

  /// Clears cover cache
  void clearCache() {
    _ref.read(coverImageProvider.notifier).clearCache();
  }
}

/// Wrapper class for loading operations
class LoadingOperations {
  final Ref _ref;

  LoadingOperations(this._ref);

  /// Starts loading with progress for a library
  Future<void> startLoading(dynamic library) async {
    await _ref.read(loadingProgressProvider.notifier).startLoading(library);
  }

  /// Gets loading progress for a library
  dynamic getProgress(String libraryId) {
    return _ref.read(loadingProgressProvider.notifier).getProgress(libraryId);
  }

  /// Gets progress stream for a library
  Stream<dynamic>? getProgressStream(String libraryId) {
    return _ref
        .read(loadingProgressProvider.notifier)
        .getProgressStream(libraryId);
  }

  /// Checks if library is loading
  bool isLoading(String libraryId) {
    return _ref.read(loadingProgressProvider.notifier).isLoading(libraryId);
  }

  /// Checks if library is completed
  bool isCompleted(String libraryId) {
    return _ref.read(loadingProgressProvider.notifier).isCompleted(libraryId);
  }

  /// Checks if library has error
  bool hasError(String libraryId) {
    return _ref.read(loadingProgressProvider.notifier).hasError(libraryId);
  }

  /// Clears progress for a library
  void clearProgress(String libraryId) {
    _ref.read(loadingProgressProvider.notifier).clearProgress(libraryId);
  }
}

/// Wrapper class for sync operations
class SyncOperations {
  final Ref _ref;

  SyncOperations(this._ref);

  /// Starts background loading for all libraries
  Future<void> startBackgroundLoading(
      List<Library> libraries, String selectedLibraryId) async {
    await _ref
        .read(optimizedBackgroundLoadingProvider.notifier)
        .startBackgroundLoading(libraries, selectedLibraryId);
  }

  /// Gets library loading progress
  dynamic getLibraryProgress(String libraryId) {
    return _ref
        .read(optimizedBackgroundLoadingProvider.notifier)
        .getLibraryProgress(libraryId);
  }

  /// Gets library progress stream
  Stream<dynamic>? getLibraryProgressStream(String libraryId) {
    return _ref
        .read(optimizedBackgroundLoadingProvider.notifier)
        .getLibraryProgressStream(libraryId);
  }

  /// Checks if library is loading
  bool isLibraryLoading(String libraryId) {
    return _ref
        .read(optimizedBackgroundLoadingProvider.notifier)
        .isLibraryLoading(libraryId);
  }

  /// Checks if library is loaded
  bool isLibraryLoaded(String libraryId) {
    return _ref
        .read(optimizedBackgroundLoadingProvider.notifier)
        .isLibraryLoaded(libraryId);
  }

  /// Checks if library has error
  bool hasLibraryError(String libraryId) {
    return _ref
        .read(optimizedBackgroundLoadingProvider.notifier)
        .hasLibraryError(libraryId);
  }

  /// Gets loading duration for a library
  Duration? getLibraryLoadingDuration(String libraryId) {
    return _ref
        .read(optimizedBackgroundLoadingProvider.notifier)
        .getLibraryLoadingDuration(libraryId);
  }

  /// Gets the number of libraries currently loading
  int get loadingLibrariesCount {
    return _ref
        .read(optimizedBackgroundLoadingProvider.notifier)
        .loadingLibrariesCount;
  }

  /// Gets the list of library IDs currently loading
  List<String> get loadingLibraryIds {
    return _ref
        .read(optimizedBackgroundLoadingProvider.notifier)
        .loadingLibraryIds;
  }

  /// Cancels library loading
  void cancelLibraryLoading(String libraryId) {
    _ref
        .read(optimizedBackgroundLoadingProvider.notifier)
        .cancelLibraryLoading(libraryId);
  }

  /// Cancels all loading
  void cancelAllLoading() {
    _ref.read(optimizedBackgroundLoadingProvider.notifier).cancelAllLoading();
  }
}
