import 'dart:async';
import 'package:audiobookshelf_flutter/services/sync_service.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for sync state
final syncStateProvider =
    StateNotifierProvider<SyncStateNotifier, SyncState>((ref) {
  return SyncStateNotifier(ref.watch(syncServiceProvider));
});

/// Sync state
class SyncState {
  final bool isSyncing;
  final SyncStatus? lastSyncStatus;
  final String? lastSyncMessage;
  final double? lastSyncProgress;
  final DateTime? lastSyncTime;
  final int pendingSyncCount;

  const SyncState({
    this.isSyncing = false,
    this.lastSyncStatus,
    this.lastSyncMessage,
    this.lastSyncProgress,
    this.lastSyncTime,
    this.pendingSyncCount = 0,
  });

  SyncState copyWith({
    bool? isSyncing,
    SyncStatus? lastSyncStatus,
    String? lastSyncMessage,
    double? lastSyncProgress,
    DateTime? lastSyncTime,
    int? pendingSyncCount,
  }) {
    return SyncState(
      isSyncing: isSyncing ?? this.isSyncing,
      lastSyncStatus: lastSyncStatus ?? this.lastSyncStatus,
      lastSyncMessage: lastSyncMessage ?? this.lastSyncMessage,
      lastSyncProgress: lastSyncProgress ?? this.lastSyncProgress,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
      pendingSyncCount: pendingSyncCount ?? this.pendingSyncCount,
    );
  }
}

/// Sync state notifier
class SyncStateNotifier extends StateNotifier<SyncState> {
  final SyncService _syncService;
  StreamSubscription<SyncProgress>? _syncProgressSubscription;

  SyncStateNotifier(this._syncService) : super(const SyncState()) {
    _initializeSyncListener();
    _loadLastSyncTime();
  }

  void _initializeSyncListener() {
    _syncProgressSubscription =
        _syncService.syncProgressStream.listen((progress) {
      state = state.copyWith(
        isSyncing: progress.status != SyncStatus.completed &&
            progress.status != SyncStatus.failed,
        lastSyncStatus: progress.status,
        lastSyncMessage: progress.message,
        lastSyncProgress: progress.progress,
        lastSyncTime: progress.status == SyncStatus.completed
            ? DateTime.now()
            : state.lastSyncTime,
      );
    });
  }

  Future<void> _loadLastSyncTime() async {
    final lastSyncTime = await _syncService.getLastSyncTime();
    if (lastSyncTime != null) {
      state = state.copyWith(lastSyncTime: lastSyncTime);
    }
  }

  /// Start full sync (upload and download)
  Future<void> startFullSync(WidgetRef ref) async {
    final userModel = ref.read(userModelNotifierProvider);
    if (userModel != null) {
      await _syncService.fullSync(userModel);
    }
  }

  /// Start upload sync (local progress to server)
  Future<void> startUploadSync(WidgetRef ref) async {
    final userModel = ref.read(userModelNotifierProvider);
    if (userModel != null) {
      await _syncService.syncProgressToServer(userModel);
    }
  }

  /// Start download sync (server progress to local)
  Future<void> startDownloadSync(WidgetRef ref) async {
    final userModel = ref.read(userModelNotifierProvider);
    if (userModel != null) {
      await _syncService.downloadProgressFromServer(userModel);
    }
  }

  /// Save offline progress
  Future<void> saveOfflineProgress(
      String libraryItemId, Map<String, dynamic> progress) async {
    await _syncService.saveOfflineProgress(libraryItemId, progress);
    await _updatePendingSyncCount();
  }

  /// Get offline progress
  Future<Map<String, dynamic>?> getOfflineProgress(String libraryItemId) async {
    return await _syncService.getOfflineProgress(libraryItemId);
  }

  /// Update pending sync count
  Future<void> _updatePendingSyncCount() async {
    final pendingProgress = await _syncService.getPendingSyncProgress();
    state = state.copyWith(pendingSyncCount: pendingProgress.length);
  }

  /// Check if sync is needed
  bool get isSyncNeeded => state.pendingSyncCount > 0;

  /// Get sync status text
  String get syncStatusText {
    if (state.isSyncing) {
      return 'Syncing...';
    } else if (state.lastSyncStatus == SyncStatus.completed) {
      return 'Last sync: ${_formatLastSyncTime()}';
    } else if (state.lastSyncStatus == SyncStatus.failed) {
      return 'Sync failed';
    } else if (state.pendingSyncCount > 0) {
      return '${state.pendingSyncCount} items pending sync';
    } else {
      return 'No sync needed';
    }
  }

  String _formatLastSyncTime() {
    if (state.lastSyncTime == null) return 'Never';

    final now = DateTime.now();
    final diff = now.difference(state.lastSyncTime!);

    if (diff.inMinutes < 1) {
      return 'Just now';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else {
      return '${diff.inDays}d ago';
    }
  }

  @override
  void dispose() {
    _syncProgressSubscription?.cancel();
    super.dispose();
  }
}
