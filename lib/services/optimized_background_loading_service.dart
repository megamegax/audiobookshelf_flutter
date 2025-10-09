import 'dart:async';

import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/services/incremental_sync_service.dart';
import 'package:audiobookshelf_flutter/services/loading_progress_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for the optimized background loading service
final optimizedBackgroundLoadingServiceProvider =
    Provider<OptimizedBackgroundLoadingService>((ref) {
  return OptimizedBackgroundLoadingService(
    ref.watch(incrementalSyncServiceProvider),
    ref.watch(loadingProgressServiceProvider),
  );
});

/// Optimized background loading service that uses incremental sync and detailed progress tracking
class OptimizedBackgroundLoadingService {
  final IncrementalSyncService _syncService;
  final LoadingProgressService _progressService;

  // Track loading state for each library
  final Map<String, bool> _loadingStates = {};
  final Map<String, Completer<void>> _loadingCompleters = {};

  OptimizedBackgroundLoadingService(
    this._syncService,
    this._progressService,
  );

  /// Loads all libraries in background with optimized incremental sync
  Future<void> loadAllLibrariesInBackground(
    UserModel userModel,
    List<Library> libraries,
    String selectedLibraryId,
  ) async {
    if (kDebugMode) {
      print(
          '[OPTIMIZED_LOADING] Starting optimized background loading for ${libraries.length} libraries');
    }

    // Load selected library first (highest priority)
    final selectedLibrary = libraries.firstWhere(
      (lib) => lib.id == selectedLibraryId,
      orElse: () => libraries.first,
    );

    // Start loading selected library immediately
    _loadLibraryWithPriority(userModel, selectedLibrary, true);

    // Load other libraries in background with lower priority
    final otherLibraries =
        libraries.where((lib) => lib.id != selectedLibraryId).toList();

    // Process other libraries with delay to avoid overwhelming the server
    for (int i = 0; i < otherLibraries.length; i++) {
      final library = otherLibraries[i];

      // Add delay between libraries to be gentle on the server
      if (i > 0) {
        await Future.delayed(const Duration(seconds: 2));
      }

      // Load library in background (don't await to allow parallel processing)
      _loadLibraryWithPriority(userModel, library, false);
    }
  }

  /// Loads a single library with specified priority
  Future<void> _loadLibraryWithPriority(
    UserModel userModel,
    Library library,
    bool isHighPriority,
  ) async {
    final libraryId = library.id;

    // Check if already loading
    if (_loadingStates[libraryId] == true) {
      if (kDebugMode) {
        print(
            '[OPTIMIZED_LOADING] Library ${library.name} is already loading, skipping');
      }
      return;
    }

    // Check if there's an existing completer
    if (_loadingCompleters.containsKey(libraryId)) {
      if (kDebugMode) {
        print(
            '[OPTIMIZED_LOADING] Waiting for existing loading to complete for ${library.name}');
      }
      return await _loadingCompleters[libraryId]!.future;
    }

    // Create new completer
    final completer = Completer<void>();
    _loadingCompleters[libraryId] = completer;
    _loadingStates[libraryId] = true;

    if (kDebugMode) {
      print(
          '[OPTIMIZED_LOADING] Loading library: ${library.name} (Priority: ${isHighPriority ? 'HIGH' : 'LOW'})');
    }

    try {
      // Use the loading progress service for detailed progress tracking
      await _progressService.startLoadingWithProgress(userModel, library);

      if (kDebugMode) {
        print(
            '[OPTIMIZED_LOADING] ${library.name}: Loading completed successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[OPTIMIZED_LOADING] ${library.name}: Loading failed: $e');
      }
    } finally {
      _loadingStates[libraryId] = false;
      _loadingCompleters.remove(libraryId);
      completer.complete();
    }
  }

  /// Gets loading progress for a specific library
  LoadingProgress? getLoadingProgress(String libraryId) {
    return _progressService.getProgress(libraryId);
  }

  /// Gets progress stream for a specific library
  Stream<LoadingProgress>? getLoadingProgressStream(String libraryId) {
    return _progressService.getProgressStream(libraryId);
  }

  /// Checks if a library is currently being loaded
  bool isLibraryLoading(String libraryId) {
    return _loadingStates[libraryId] == true ||
        _progressService.isLoading(libraryId);
  }

  /// Checks if a library has been loaded
  bool isLibraryLoaded(String libraryId) {
    return _progressService.isCompleted(libraryId);
  }

  /// Checks if a library encountered an error
  bool hasLibraryError(String libraryId) {
    return _progressService.hasError(libraryId);
  }

  /// Gets sync statistics for a library
  Future<SyncStatistics> getSyncStatistics(String libraryId) async {
    return await _syncService.getSyncStatistics(libraryId);
  }

  /// Cancels loading for a specific library
  void cancelLoading(String libraryId) {
    _loadingStates[libraryId] = false;
    _loadingCompleters.remove(libraryId);
    _progressService.clearProgress(libraryId);
  }

  /// Cancels all background loading
  void cancelAllLoading() {
    _loadingStates.clear();
    for (final completer in _loadingCompleters.values) {
      if (!completer.isCompleted) {
        completer.complete();
      }
    }
    _loadingCompleters.clear();
    _progressService.clearAllProgress();
  }

  /// Gets loading duration for a library
  Duration? getLoadingDuration(String libraryId) {
    return _progressService.getLoadingDuration(libraryId);
  }

  /// Gets the number of libraries currently loading
  int get loadingLibrariesCount {
    return _loadingStates.values.where((loading) => loading).length;
  }

  /// Gets the list of library IDs currently loading
  List<String> get loadingLibraryIds {
    return _loadingStates.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }

  /// Disposes resources
  void dispose() {
    cancelAllLoading();
  }
}

