import 'dart:async';

import 'package:audiobookshelf_flutter/database/author_entity.dart';
import 'package:audiobookshelf_flutter/database/narrator_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/repositories/authors_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/narrators_repository.dart';
import 'package:audiobookshelf_flutter/services/incremental_sync_service.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for the loading progress service
final loadingProgressServiceProvider = Provider<LoadingProgressService>((ref) {
  return LoadingProgressService(
    ref.watch(incrementalSyncServiceProvider),
    ref.watch(libraryServiceProvider),
    ref.read(libraryItemsRepositoryProvider.future),
    ref.read(authorsRepositoryProvider.future),
    ref.read(narratorsRepositoryProvider.future),
  );
});

/// Service responsible for managing loading progress with detailed status messages
class LoadingProgressService {
  final IncrementalSyncService _syncService;
  final LibraryService _libraryService;
  final Future<LibraryItemsRepository> _libraryItemsRepository;
  final Future<AuthorsRepository> _authorsRepository;
  final Future<NarratorsRepository> _narratorsRepository;

  // Progress tracking
  final Map<String, LoadingProgress> _progressMap = {};
  final Map<String, StreamController<LoadingProgress>> _progressControllers =
      {};

  LoadingProgressService(
    this._syncService,
    this._libraryService,
    this._libraryItemsRepository,
    this._authorsRepository,
    this._narratorsRepository,
  );

  /// Starts loading with progress tracking for a library
  Future<void> startLoadingWithProgress(
    UserModel userModel,
    Library library,
  ) async {
    final libraryId = library.id;
    final libraryName = library.name;

    if (kDebugMode) {
      print(
          '[LOADING_PROGRESS] Starting loading with progress for: $libraryName');
    }

    // Initialize progress
    _progressMap[libraryId] = LoadingProgress(
      libraryId: libraryId,
      libraryName: libraryName,
      status: LoadingStatus.initializing,
      progress: 0.0,
      currentStep: 'Initializing...',
      itemsProcessed: 0,
      totalItems: 0,
      startTime: DateTime.now(),
    );

    // Create progress controller if it doesn't exist
    if (!_progressControllers.containsKey(libraryId)) {
      _progressControllers[libraryId] =
          StreamController<LoadingProgress>.broadcast();
    }

    // Emit initial progress
    _emitProgress(libraryId);

    try {
      // Step 1: Checking local data
      await _updateProgress(
        libraryId,
        status: LoadingStatus.checkingLocalData,
        progress: 0.1,
        currentStep: 'Checking local data...',
      );

      // Get sync statistics
      final stats = await _syncService.getSyncStatistics(libraryId);

      await _updateProgress(
        libraryId,
        status: LoadingStatus.checkingLocalData,
        progress: 0.2,
        currentStep: 'Found ${stats.localItemCount} local items',
      );

      // Step 2: Connecting to server
      await _updateProgress(
        libraryId,
        status: LoadingStatus.connectingToServer,
        progress: 0.3,
        currentStep: 'Connecting to server...',
      );

      // Step 3: Fetching library data
      await _updateProgress(
        libraryId,
        status: LoadingStatus.fetchingData,
        progress: 0.4,
        currentStep: 'Fetching library data from server...',
      );

      // Step 4: Performing incremental sync
      await _updateProgress(
        libraryId,
        status: LoadingStatus.syncingData,
        progress: 0.5,
        currentStep: 'Synchronizing data...',
      );

      final syncResult = await _syncService.syncLibrary(userModel, library);

      if (syncResult.isSuccess) {
        await _updateProgress(
          libraryId,
          status: LoadingStatus.syncingData,
          progress: 0.8,
          currentStep:
              'Sync completed: ${syncResult.newItems} new, ${syncResult.updatedItems} updated, ${syncResult.skippedItems} skipped',
          itemsProcessed: syncResult.totalProcessed,
          totalItems: syncResult.totalProcessed,
        );

        // Step 5: Fetching series
        await _updateProgress(
          libraryId,
          status: LoadingStatus.fetchingData,
          progress: 0.8,
          currentStep: 'Fetching series from server...',
        );

        await _fetchSeries(userModel, libraryId);

        // Step 6: Fetching authors and narrators
        await _updateProgress(
          libraryId,
          status: LoadingStatus.fetchingData,
          progress: 0.85,
          currentStep: 'Fetching authors and narrators...',
        );

        await _fetchAuthorsAndNarrators(userModel, libraryId);

        // Step 6: Finalizing
        await _updateProgress(
          libraryId,
          status: LoadingStatus.finalizing,
          progress: 0.9,
          currentStep: 'Finalizing...',
        );

        // Step 6: Completed
        await _updateProgress(
          libraryId,
          status: LoadingStatus.completed,
          progress: 1.0,
          currentStep: 'Loading completed successfully!',
          endTime: DateTime.now(),
        );
      } else {
        await _updateProgress(
          libraryId,
          status: LoadingStatus.error,
          progress: 0.0,
          currentStep: 'Error: ${syncResult.error}',
          endTime: DateTime.now(),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('[LOADING_PROGRESS] Error during loading: $e');
      }

      await _updateProgress(
        libraryId,
        status: LoadingStatus.error,
        progress: 0.0,
        currentStep: 'Error: $e',
        endTime: DateTime.now(),
      );
    }
  }

  /// Updates progress for a specific library
  Future<void> _updateProgress(
    String libraryId, {
    required LoadingStatus status,
    required double progress,
    required String currentStep,
    int? itemsProcessed,
    int? totalItems,
    DateTime? endTime,
  }) async {
    final currentProgress = _progressMap[libraryId];
    if (currentProgress == null) return;

    _progressMap[libraryId] = currentProgress.copyWith(
      status: status,
      progress: progress,
      currentStep: currentStep,
      itemsProcessed: itemsProcessed ?? currentProgress.itemsProcessed,
      totalItems: totalItems ?? currentProgress.totalItems,
      endTime: endTime,
    );

    _emitProgress(libraryId);

    // Add a small delay to make progress visible
    await Future.delayed(const Duration(milliseconds: 100));
  }

  /// Emits progress update
  void _emitProgress(String libraryId) {
    final progress = _progressMap[libraryId];
    if (progress != null) {
      _progressControllers[libraryId]?.add(progress);
    }
  }

  /// Gets current progress for a library
  LoadingProgress? getProgress(String libraryId) {
    return _progressMap[libraryId];
  }

  /// Gets progress stream for a library
  Stream<LoadingProgress>? getProgressStream(String libraryId) {
    return _progressControllers[libraryId]?.stream;
  }

  /// Checks if a library is currently loading
  bool isLoading(String libraryId) {
    final progress = _progressMap[libraryId];
    return progress != null &&
        progress.status != LoadingStatus.completed &&
        progress.status != LoadingStatus.error;
  }

  /// Checks if a library has completed loading
  bool isCompleted(String libraryId) {
    final progress = _progressMap[libraryId];
    return progress?.status == LoadingStatus.completed;
  }

  /// Checks if a library encountered an error
  bool hasError(String libraryId) {
    final progress = _progressMap[libraryId];
    return progress?.status == LoadingStatus.error;
  }

  /// Gets loading duration for a library
  Duration? getLoadingDuration(String libraryId) {
    final progress = _progressMap[libraryId];
    if (progress?.startTime == null) return null;

    final endTime = progress!.endTime ?? DateTime.now();
    return endTime.difference(progress.startTime);
  }

  /// Clears progress for a library
  void clearProgress(String libraryId) {
    _progressMap.remove(libraryId);
    _progressControllers[libraryId]?.close();
    _progressControllers.remove(libraryId);
  }

  /// Clears all progress
  void clearAllProgress() {
    for (final controller in _progressControllers.values) {
      controller.close();
    }
    _progressControllers.clear();
    _progressMap.clear();
  }

  /// Disposes resources
  void dispose() {
    clearAllProgress();
  }

  /// Fetches and stores series for a library
  Future<void> _fetchSeries(UserModel userModel, String libraryId) async {
    try {
      if (kDebugMode) {
        print('[LOADING_PROGRESS] Fetching series for library: $libraryId');
      }

      // Update progress - connecting to server
      await _updateProgress(
        libraryId,
        status: LoadingStatus.fetchingData,
        progress: 0.82,
        currentStep: 'Connecting to server for series data...',
      );

      // Fetch series from backend
      final seriesItems =
          await _libraryService.fetchSeries(userModel, libraryId);

      if (kDebugMode) {
        print(
            '[LOADING_PROGRESS] Fetched ${seriesItems.length} series from backend');
      }

      // Update progress - saving to database
      await _updateProgress(
        libraryId,
        status: LoadingStatus.fetchingData,
        progress: 0.84,
        currentStep: 'Saving ${seriesItems.length} series to database...',
      );

      // Save series to database
      final repository = await _libraryItemsRepository;
      repository.saveSeriesItems(seriesItems);

      if (kDebugMode) {
        print(
            '[LOADING_PROGRESS] Saved ${seriesItems.length} series for library: $libraryId');
      }

      // Update progress - series completed
      await _updateProgress(
        libraryId,
        status: LoadingStatus.fetchingData,
        progress: 0.85,
        currentStep: 'Series data loaded successfully!',
      );
    } catch (e) {
      if (kDebugMode) {
        print('[LOADING_PROGRESS] Error fetching series: $e');
      }
      
      // Update progress with error
      await _updateProgress(
        libraryId,
        status: LoadingStatus.error,
        progress: 0.8,
        currentStep: 'Error loading series: $e',
      );
      
      // Don't throw - this is not critical for the main loading process
    }
  }

  /// Fetches and stores authors and narrators for a library
  Future<void> _fetchAuthorsAndNarrators(
      UserModel userModel, String libraryId) async {
    try {
      if (kDebugMode) {
        print(
            '[LOADING_PROGRESS] Fetching authors and narrators for library: $libraryId');
      }

      // Fetch authors
      final authorsData =
          await _libraryService.fetchAuthors(userModel, libraryId);
      final authors =
          authorsData.map((data) => AuthorEntity.fromJson(data)).toList();

      // Save authors to database
      final authorsRepository = await _authorsRepository;
      await authorsRepository.saveAuthors(authors);

      if (kDebugMode) {
        print(
            '[LOADING_PROGRESS] Saved ${authors.length} authors for library: $libraryId');
      }

      // Fetch narrators
      final narratorsData =
          await _libraryService.fetchNarrators(userModel, libraryId);
      final narrators =
          narratorsData.map((data) => NarratorEntity.fromJson(data)).toList();

      // Save narrators to database
      final narratorsRepository = await _narratorsRepository;
      await narratorsRepository.saveNarrators(narrators);

      if (kDebugMode) {
        print(
            '[LOADING_PROGRESS] Saved ${narrators.length} narrators for library: $libraryId');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[LOADING_PROGRESS] Error fetching authors and narrators: $e');
      }
      // Don't throw - this is not critical for the main loading process
    }
  }
}

/// Status of loading operation
enum LoadingStatus {
  initializing,
  checkingLocalData,
  connectingToServer,
  fetchingData,
  syncingData,
  finalizing,
  completed,
  error,
}

/// Progress information for loading operations
class LoadingProgress {
  final String libraryId;
  final String libraryName;
  final LoadingStatus status;
  final double progress; // 0.0 to 1.0
  final String currentStep;
  final int itemsProcessed;
  final int totalItems;
  final DateTime startTime;
  final DateTime? endTime;

  LoadingProgress({
    required this.libraryId,
    required this.libraryName,
    required this.status,
    required this.progress,
    required this.currentStep,
    required this.itemsProcessed,
    required this.totalItems,
    required this.startTime,
    this.endTime,
  });

  LoadingProgress copyWith({
    String? libraryId,
    String? libraryName,
    LoadingStatus? status,
    double? progress,
    String? currentStep,
    int? itemsProcessed,
    int? totalItems,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return LoadingProgress(
      libraryId: libraryId ?? this.libraryId,
      libraryName: libraryName ?? this.libraryName,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      currentStep: currentStep ?? this.currentStep,
      itemsProcessed: itemsProcessed ?? this.itemsProcessed,
      totalItems: totalItems ?? this.totalItems,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  /// Gets the percentage as an integer
  int get percentage => (progress * 100).round();

  /// Gets the loading duration
  Duration get duration {
    final end = endTime ?? DateTime.now();
    return end.difference(startTime);
  }

  /// Gets a user-friendly status message
  String get statusMessage {
    switch (status) {
      case LoadingStatus.initializing:
        return 'Initializing...';
      case LoadingStatus.checkingLocalData:
        return 'Checking local data...';
      case LoadingStatus.connectingToServer:
        return 'Connecting to server...';
      case LoadingStatus.fetchingData:
        return 'Fetching data from server...';
      case LoadingStatus.syncingData:
        return 'Synchronizing data...';
      case LoadingStatus.finalizing:
        return 'Finalizing...';
      case LoadingStatus.completed:
        return 'Loading completed!';
      case LoadingStatus.error:
        return 'Error occurred';
    }
  }
}
