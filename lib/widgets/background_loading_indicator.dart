import 'package:audiobookshelf_flutter/provider/optimized_background_loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BackgroundLoadingIndicator extends ConsumerWidget {
  const BackgroundLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState = ref.watch(optimizedBackgroundLoadingProvider);
    final loadingNotifier =
        ref.read(optimizedBackgroundLoadingProvider.notifier);

    if (loadingState.isLoading) {
      return _buildLoadingIndicator(context, loadingNotifier);
    } else if (loadingState.isCompleted) {
      return _buildCompletedIndicator(context);
    } else if (loadingState.hasError) {
      return _buildErrorIndicator(
          context, loadingState.errorMessage ?? 'Unknown error');
    } else if (loadingState.isCancelled) {
      return const SizedBox.shrink();
    }

    return const SizedBox.shrink();
  }

  Widget _buildLoadingIndicator(
      BuildContext context, OptimizedBackgroundLoadingNotifier notifier) {
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
                  'Loading libraries in background... (${notifier.loadingLibrariesCount} active)',
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
                  notifier.cancelAllLoading();
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
      BuildContext context, OptimizedBackgroundLoadingNotifier notifier) {
    final loadingLibraryIds = notifier.loadingLibraryIds;

    if (loadingLibraryIds.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: loadingLibraryIds.map((libraryId) {
        final progress = notifier.getLibraryProgress(libraryId);
        if (progress == null) return const SizedBox.shrink();

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.sync,
                    size: 12,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      progress.libraryName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Text(
                    '${progress.itemsProcessed}/${progress.totalItems}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
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
              if (progress.currentStep.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  progress.currentStep,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ],
            ],
          ),
        );
      }).toList(),
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
              'Loading failed: $message',
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
