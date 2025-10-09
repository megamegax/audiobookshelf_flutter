import 'dart:typed_data';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/pages/book_details.dart';
import 'package:audiobookshelf_flutter/provider/download_provider.dart';
import 'package:audiobookshelf_flutter/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookCard extends ConsumerWidget {
  final LibraryItemEntity libraryItem;
  const BookCard({super.key, required this.libraryItem});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double progress = libraryItem.media.progress == null
        ? 0
        : libraryItem.media.progress!.progress!;

    return SizedBox(
      width: 180,
      height: 300,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            NavigationService.pushWithHero(
              context,
              BookDetails(
                  item: libraryItem, heroTag: 'book-cover-${libraryItem.id}'),
              'book-cover-${libraryItem.id}',
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'book-cover-${libraryItem.id}',
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: SizedBox(
                        width: 180,
                        height: 180,
                        child: libraryItem.media.coverBytes?.isNotEmpty == true
                            ? Builder(
                                builder: (context) {
                                  try {
                                    return Image.memory(
                                      Uint8List.fromList(
                                          libraryItem.media.coverBytes!),
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surfaceContainerHighest,
                                          child: Icon(
                                            Icons.library_music,
                                            size: 48,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant,
                                          ),
                                        );
                                      },
                                    );
                                  } catch (e) {
                                    if (kDebugMode) {
                                      print(
                                          '[BOOK_CARD] Error creating MemoryImage for book ${libraryItem.id}: $e');
                                    }
                                    return Container(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surfaceContainerHighest,
                                      child: Icon(
                                        Icons.library_music,
                                        size: 48,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                      ),
                                    );
                                  }
                                },
                              )
                            : Container(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest,
                                child: Icon(
                                  Icons.library_music,
                                  size: 48,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                              ),
                      ),
                    ),
                    // Download indicator
                    Consumer(
                      builder: (context, ref, child) {
                        final downloadedItemsAsync =
                            ref.watch(downloadedItemsProvider);
                        return downloadedItemsAsync.when(
                          data: (items) {
                            final isDownloaded = items.any((item) =>
                                item.id == libraryItem.itemId ||
                                item.title ==
                                    libraryItem.media.metadata?.title);
                            if (isDownloaded) {
                              return Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow
                                            .withOpacity(0.2),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.download_done,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    size: 16,
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                          loading: () => const SizedBox.shrink(),
                          error: (_, __) => const SizedBox.shrink(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              if (progress > 0)
                Container(
                  height: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      progress == 1
                          ? Theme.of(context).colorScheme.tertiary
                          : Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        libraryItem.media.metadata?.title ?? "-",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        libraryItem.media.metadata?.authorName ?? "-",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              fontWeight: FontWeight.w400,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
