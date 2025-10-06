import 'package:audiobookshelf_flutter/provider/sync_provider.dart';
import 'package:audiobookshelf_flutter/services/sync_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SyncIndicator extends ConsumerWidget {
  const SyncIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncState = ref.watch(syncStateProvider);
    final syncNotifier = ref.read(syncStateProvider.notifier);

    // Only show sync indicator when:
    // 1. Currently syncing
    // 2. Sync failed (needs attention)
    // 3. There are pending items that need sync
    final shouldShow = syncState.isSyncing ||
        syncState.lastSyncStatus == SyncStatus.failed ||
        syncNotifier.isSyncNeeded;

    if (!shouldShow) {
      return const SizedBox.shrink(); // Hide when no sync needed
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _getSyncColor(syncState.lastSyncStatus),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (syncState.isSyncing) ...[
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ] else ...[
            Icon(
              _getSyncIcon(syncState.lastSyncStatus),
              size: 16,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            syncNotifier.syncStatusText,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Color _getSyncColor(SyncStatus? status) {
    switch (status) {
      case SyncStatus.completed:
        return Colors.green;
      case SyncStatus.failed:
        return Colors.red;
      case SyncStatus.syncing:
      case SyncStatus.downloading:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getSyncIcon(SyncStatus? status) {
    switch (status) {
      case SyncStatus.completed:
        return Icons.check_circle;
      case SyncStatus.failed:
        return Icons.error;
      case SyncStatus.syncing:
      case SyncStatus.downloading:
        return Icons.sync;
      default:
        return Icons.sync_disabled;
    }
  }
}

class SyncButton extends ConsumerWidget {
  const SyncButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncState = ref.watch(syncStateProvider);
    final syncNotifier = ref.read(syncStateProvider.notifier);

    return IconButton(
      icon: syncState.isSyncing
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.onSurface,
                ),
              ),
            )
          : Icon(
              Icons.sync,
              color: syncNotifier.isSyncNeeded
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
      onPressed: syncState.isSyncing
          ? null
          : () => _showSyncOptions(context, syncNotifier, ref),
      tooltip: 'Sync',
    );
  }

  void _showSyncOptions(
      BuildContext context, SyncStateNotifier syncNotifier, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sync Options',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.sync),
              title: const Text('Full Sync'),
              subtitle: const Text('Upload and download progress'),
              onTap: () {
                Navigator.pop(context);
                syncNotifier.startFullSync(ref);
              },
            ),
            ListTile(
              leading: const Icon(Icons.upload),
              title: const Text('Upload Progress'),
              subtitle: const Text('Upload local progress to server'),
              onTap: () {
                Navigator.pop(context);
                syncNotifier.startUploadSync(ref);
              },
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Download Progress'),
              subtitle: const Text('Download server progress to local'),
              onTap: () {
                Navigator.pop(context);
                syncNotifier.startDownloadSync(ref);
              },
            ),
          ],
        ),
      ),
    );
  }
}
