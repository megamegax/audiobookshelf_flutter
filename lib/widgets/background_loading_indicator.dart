import 'package:audiobookshelf_flutter/provider/background_library_loading_provider.dart';
import 'package:audiobookshelf_flutter/services/background_library_loading_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BackgroundLoadingIndicator extends ConsumerWidget {
  const BackgroundLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState = ref.watch(backgroundLibraryLoadingStateProvider);
    final loadingNotifier =
        ref.read(backgroundLibraryLoadingStateProvider.notifier);

    if (loadingState is BackgroundLibraryLoadingState) {
      if (loadingState.runtimeType.toString().contains('_Initial')) {
        return const SizedBox.shrink();
      } else if (loadingState.runtimeType.toString().contains('_Loading')) {
        return _buildLoadingIndicator(context, loadingNotifier);
      } else if (loadingState.runtimeType.toString().contains('_Completed')) {
        return _buildCompletedIndicator(context);
      } else if (loadingState.runtimeType.toString().contains('_Error')) {
        return _buildErrorIndicator(context, (loadingState as dynamic).message);
      } else if (loadingState.runtimeType.toString().contains('_Cancelled')) {
        return const SizedBox.shrink();
      }
    }
    return const SizedBox.shrink();
  }

  Widget _buildLoadingIndicator(
      BuildContext context, BackgroundLibraryLoadingStateNotifier notifier) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Loading libraries in background...',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 18,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onPressed: () {
                  notifier.cancelLoading();
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildLibraryProgressList(context, notifier),
        ],
      ),
    );
  }

  Widget _buildLibraryProgressList(
      BuildContext context, BackgroundLibraryLoadingStateNotifier notifier) {
    // This would need to be implemented to show progress for each library
    // For now, we'll show a simple progress indicator
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(2),
      ),
      child: LinearProgressIndicator(
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildCompletedIndicator(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            size: 16,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'All libraries loaded successfully',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorIndicator(BuildContext context, String message) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error,
            size: 16,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Failed to load libraries: $message',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Detailed library loading progress widget
class LibraryLoadingProgressWidget extends ConsumerWidget {
  final String libraryId;

  const LibraryLoadingProgressWidget({
    super.key,
    required this.libraryId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingNotifier =
        ref.read(backgroundLibraryLoadingStateProvider.notifier);
    final progress = loadingNotifier.getLibraryProgress(libraryId);

    if (progress == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                _getStatusIcon(progress.status),
                size: 14,
                color: _getStatusColor(context, progress.status),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  progress.libraryName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              if (progress.status == LibraryLoadingStatus.loading)
                Text(
                  '${progress.itemsLoaded}/${progress.totalItems}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
            ],
          ),
          if (progress.status == LibraryLoadingStatus.loading) ...[
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: progress.progress,
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ],
        ],
      ),
    );
  }

  IconData _getStatusIcon(LibraryLoadingStatus status) {
    switch (status) {
      case LibraryLoadingStatus.loading:
        return Icons.downloading;
      case LibraryLoadingStatus.completed:
        return Icons.check_circle;
      case LibraryLoadingStatus.failed:
        return Icons.error;
    }
  }

  Color _getStatusColor(BuildContext context, LibraryLoadingStatus status) {
    switch (status) {
      case LibraryLoadingStatus.loading:
        return Theme.of(context).colorScheme.primary;
      case LibraryLoadingStatus.completed:
        return Theme.of(context).colorScheme.primary;
      case LibraryLoadingStatus.failed:
        return Theme.of(context).colorScheme.error;
    }
  }
}
