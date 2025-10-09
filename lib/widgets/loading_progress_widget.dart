import 'package:audiobookshelf_flutter/provider/loading_progress_provider.dart';
import 'package:audiobookshelf_flutter/services/loading_progress_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingProgressWidget extends ConsumerWidget {
  final String libraryId;
  final String libraryName;

  const LoadingProgressWidget({
    super.key,
    required this.libraryId,
    required this.libraryName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressState = ref.watch(loadingProgressProvider);
    final progressStream = ref
        .watch(loadingProgressProvider.notifier)
        .getProgressStream(libraryId);

    return StreamBuilder<LoadingProgress>(
      stream: progressStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _buildInitialState(context);
        }

        final progress = snapshot.data!;
        return _buildProgressWidget(context, progress);
      },
    );
  }

  Widget _buildInitialState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Preparing to load $libraryName...',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressWidget(BuildContext context, LoadingProgress progress) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress indicator
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              children: [
                // Background circle
                CircularProgressIndicator(
                  value: 1.0,
                  strokeWidth: 8,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colorScheme.surfaceContainerHighest,
                  ),
                ),
                // Progress circle
                CircularProgressIndicator(
                  value: progress.progress,
                  strokeWidth: 8,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getProgressColor(colorScheme, progress.status),
                  ),
                ),
                // Percentage text
                Center(
                  child: Text(
                    '${progress.percentage}%',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _getProgressColor(colorScheme, progress.status),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Library name
          Text(
            libraryName,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Current step
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              progress.currentStep,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 16),

          // Items processed info
          if (progress.totalItems > 0) ...[
            Text(
              '${progress.itemsProcessed} of ${progress.totalItems} items processed',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
          ],

          // Linear progress bar
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress.progress,
              child: Container(
                decoration: BoxDecoration(
                  color: _getProgressColor(colorScheme, progress.status),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Duration info
          if (progress.status == LoadingStatus.completed ||
              progress.status == LoadingStatus.error) ...[
            Text(
              'Completed in ${_formatDuration(progress.duration)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ] else ...[
            Text(
              'Elapsed: ${_formatDuration(progress.duration)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getProgressColor(ColorScheme colorScheme, LoadingStatus status) {
    switch (status) {
      case LoadingStatus.completed:
        return colorScheme.tertiary;
      case LoadingStatus.error:
        return colorScheme.error;
      default:
        return colorScheme.primary;
    }
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;

    if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }
}

/// Compact loading progress widget for use in smaller spaces
class CompactLoadingProgressWidget extends ConsumerWidget {
  final String libraryId;

  const CompactLoadingProgressWidget({
    super.key,
    required this.libraryId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressStream = ref
        .watch(loadingProgressProvider.notifier)
        .getProgressStream(libraryId);

    return StreamBuilder<LoadingProgress>(
      stream: progressStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }

        final progress = snapshot.data!;
        return SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            value: progress.progress,
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      },
    );
  }
}

