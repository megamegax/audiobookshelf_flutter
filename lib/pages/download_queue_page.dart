import 'package:audiobookshelf_flutter/services/background_download_service.dart';
import 'package:audiobookshelf_flutter/provider/background_download_provider.dart';
import 'package:audiobookshelf_flutter/drawer/book_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DownloadQueuePage extends ConsumerWidget {
  const DownloadQueuePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundDownloadState = ref.watch(backgroundDownloadStateProvider);
    final backgroundDownloadNotifier = ref.read(backgroundDownloadStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Download Queue'),
        actions: [
          if (backgroundDownloadState.activeDownloads.isNotEmpty)
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) async {
                switch (value) {
                  case 'pause_all':
                    // Pause all downloads
                    for (final task in backgroundDownloadState.activeDownloads.values) {
                      await backgroundDownloadNotifier.pauseItemDownload(task.libraryItemId);
                    }
                    break;
                  case 'cancel_all':
                    await backgroundDownloadNotifier.cancelAllDownloads();
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'pause_all',
                  child: Text('Pause All'),
                ),
                const PopupMenuItem(
                  value: 'cancel_all',
                  child: Text('Cancel All'),
                ),
              ],
            ),
        ],
      ),
      drawer: const BookDrawer(selectedItem: SelectedItem.downloads, serverSettings: null),
      body: _buildBody(context, backgroundDownloadState, backgroundDownloadNotifier),
    );
  }

  Widget _buildBody(BuildContext context, BackgroundDownloadState state, BackgroundDownloadStateNotifier notifier) {
    if (state.activeDownloads.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.download_outlined,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'No downloads in queue',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Start downloading audiobooks to see them here',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    // Group downloads by library item
    final groupedDownloads = <String, List<DownloadTask>>{};
    for (final task in state.activeDownloads.values) {
      groupedDownloads.putIfAbsent(task.libraryItemId, () => []).add(task);
    }

    return ListView.builder(
      itemCount: groupedDownloads.length,
      itemBuilder: (context, index) {
        final libraryItemId = groupedDownloads.keys.elementAt(index);
        final tasks = groupedDownloads[libraryItemId]!;
        final firstTask = tasks.first;
        
        return _buildLibraryItemCard(context, libraryItemId, firstTask.libraryItemTitle, tasks, notifier);
      },
    );
  }

  Widget _buildLibraryItemCard(
    BuildContext context,
    String libraryItemId,
    String title,
    List<DownloadTask> tasks,
    BackgroundDownloadStateNotifier notifier,
  ) {
    final totalTracks = tasks.length;
    final completedTracks = tasks.where((task) => task.status == DownloadStatus.completed).length;
    final downloadingTracks = tasks.where((task) => task.status == DownloadStatus.downloading).length;
    final failedTracks = tasks.where((task) => task.status == DownloadStatus.failed).length;
    final pausedTracks = tasks.where((task) => task.status == DownloadStatus.paused).length;
    
    final overallProgress = tasks.fold<double>(0.0, (sum, task) => sum + task.progress) / totalTracks;
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(
            Icons.library_music,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$completedTracks/$totalTracks tracks completed'),
            if (downloadingTracks > 0) Text('$downloadingTracks downloading'),
            if (failedTracks > 0) Text('$failedTracks failed', style: const TextStyle(color: Colors.red)),
            if (pausedTracks > 0) Text('$pausedTracks paused', style: const TextStyle(color: Colors.orange)),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: overallProgress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 4),
            Text('${(overallProgress * 100).toInt()}% complete'),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) async {
            switch (value) {
              case 'pause':
                await notifier.pauseItemDownload(libraryItemId);
                break;
              case 'resume':
                await notifier.resumeItemDownload(libraryItemId);
                break;
              case 'cancel':
                await notifier.cancelItemDownload(libraryItemId);
                break;
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'pause',
              child: Text('Pause'),
            ),
            const PopupMenuItem(
              value: 'resume',
              child: Text('Resume'),
            ),
            const PopupMenuItem(
              value: 'cancel',
              child: Text('Cancel'),
            ),
          ],
        ),
        children: tasks.map((task) => _buildTrackTile(context, task, notifier)).toList(),
      ),
    );
  }

  Widget _buildTrackTile(BuildContext context, DownloadTask task, BackgroundDownloadStateNotifier notifier) {
    return ListTile(
      leading: _getStatusIcon(task.status),
      title: Text('Track ${task.track.index ?? 1}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${(task.progress * 100).toInt()}% complete'),
          if (task.status == DownloadStatus.downloading)
            LinearProgressIndicator(
              value: task.progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          if (task.error != null)
            Text(
              'Error: ${task.error}',
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
        ],
      ),
      trailing: PopupMenuButton<String>(
        onSelected: (value) async {
          switch (value) {
            case 'pause':
              await notifier.pauseItemDownload(task.libraryItemId);
              break;
            case 'resume':
              await notifier.resumeItemDownload(task.libraryItemId);
              break;
            case 'cancel':
              await notifier.cancelItemDownload(task.libraryItemId);
              break;
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'pause',
            child: Text('Pause'),
          ),
          const PopupMenuItem(
            value: 'resume',
            child: Text('Resume'),
          ),
          const PopupMenuItem(
            value: 'cancel',
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Widget _getStatusIcon(DownloadStatus status) {
    switch (status) {
      case DownloadStatus.queued:
        return const Icon(Icons.queue, color: Colors.grey);
      case DownloadStatus.downloading:
        return const Icon(Icons.downloading, color: Colors.blue);
      case DownloadStatus.paused:
        return const Icon(Icons.pause, color: Colors.orange);
      case DownloadStatus.completed:
        return const Icon(Icons.check_circle, color: Colors.green);
      case DownloadStatus.failed:
        return const Icon(Icons.error, color: Colors.red);
      case DownloadStatus.cancelled:
        return const Icon(Icons.cancel, color: Colors.grey);
    }
  }
}
