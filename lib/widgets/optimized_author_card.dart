import 'dart:typed_data';
import 'package:audiobookshelf_flutter/database/author_entity.dart';
import 'package:audiobookshelf_flutter/provider/author_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Optimized AuthorCard that uses granular providers for better performance
class OptimizedAuthorCard extends ConsumerWidget {
  final AuthorEntity author;
  final VoidCallback? onTap;
  final bool isCompact;

  const OptimizedAuthorCard({
    super.key,
    required this.author,
    this.onTap,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Use optimized providers for granular updates
    final imageBytes = ref.watch(authorImageBytesProvider(author.authorId));
    final isLoading = ref.watch(isAuthorImageLoadingProvider(author.authorId));
    final hasError = ref.watch(authorImageErrorProvider(author.authorId)) != null;

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: isCompact
            ? _buildCompactLayout(context, colorScheme, imageBytes, isLoading, hasError)
            : _buildFullLayout(context, colorScheme, imageBytes, isLoading, hasError),
      ),
    );
  }

  Widget _buildCompactLayout(
    BuildContext context,
    ColorScheme colorScheme,
    Uint8List? imageBytes,
    bool isLoading,
    bool hasError,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          _buildAuthorImage(imageBytes, isLoading, hasError, 60),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  author.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (author.bookCount != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    '${author.bookCount} books',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFullLayout(
    BuildContext context,
    ColorScheme colorScheme,
    Uint8List? imageBytes,
    bool isLoading,
    bool hasError,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAuthorImage(imageBytes, isLoading, hasError, 120),
          const SizedBox(height: 12),
          Text(
            author.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (author.bookCount != null) ...[
            const SizedBox(height: 8),
            Text(
              '${author.bookCount} books',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAuthorImage(
    Uint8List? imageBytes,
    bool isLoading,
    bool hasError,
    double size,
  ) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
      ),
      child: ClipOval(
        child: isLoading
            ? const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            : hasError
                ? Icon(
                    Icons.person,
                    size: size * 0.6,
                    color: Colors.grey[600],
                  )
                : imageBytes != null
                    ? Image.memory(
                        imageBytes,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            size: size * 0.6,
                            color: Colors.grey[600],
                          );
                        },
                      )
                    : Icon(
                        Icons.person,
                        size: size * 0.6,
                        color: Colors.grey[600],
                      ),
      ),
    );
  }
}
