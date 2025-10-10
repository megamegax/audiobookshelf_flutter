import 'dart:typed_data';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item_new.dart';
import 'package:audiobookshelf_flutter/model/libraries/media.dart';
import 'package:audiobookshelf_flutter/model/libraries/collapsed_series.dart';
import 'package:audiobookshelf_flutter/model/libraries/meta_data.dart';
import 'package:audiobookshelf_flutter/pages/book_details.dart';
import 'package:audiobookshelf_flutter/provider/download_provider.dart';
import 'package:audiobookshelf_flutter/provider/cover_image_provider.dart';
import 'package:audiobookshelf_flutter/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookCard extends ConsumerStatefulWidget {
  final LibraryItemEntity libraryItem;
  const BookCard({super.key, required this.libraryItem});

  @override
  ConsumerState<BookCard> createState() => _BookCardState();
}

class _BookCardState extends ConsumerState<BookCard> {
  ImageProvider? _cachedImageProvider;

  @override
  void initState() {
    super.initState();

    // Cache the image provider to prevent recreation
    if (widget.libraryItem.media.coverBytes?.isNotEmpty == true) {
      try {
        _cachedImageProvider = MemoryImage(
          Uint8List.fromList(widget.libraryItem.media.coverBytes!),
        );
      } catch (e) {
        if (kDebugMode) {
          print(
              '[BOOK_CARD] Error creating MemoryImage for book ${widget.libraryItem.id}: $e');
        }
        _cachedImageProvider = null;
      }
    }

    // Check if cover is missing and trigger download after the widget tree is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _checkAndDownloadCover();
      }
    });
  }

  void _checkAndDownloadCover() {
    // Check if cover is missing and trigger download
    if (widget.libraryItem.media.coverBytes?.isEmpty != false) {
      _downloadCover();
    }
  }

  Future<void> _downloadCover() async {
    try {
      // Convert LibraryItemEntity to LibraryItemNew for the cover download
      final libraryItemNew = LibraryItemNew.book(
        id: widget.libraryItem.itemId,
        ino: widget.libraryItem.ino,
        libraryId: widget.libraryItem.libraryId,
        folderId: widget.libraryItem.folderId,
        path: widget.libraryItem.path,
        relPath: widget.libraryItem.relPath,
        isFile: widget.libraryItem.isFile,
        mtimeMs: widget.libraryItem.mtimeMs,
        ctimeMs: widget.libraryItem.ctimeMs,
        birthtimeMs: widget.libraryItem.birthtimeMs,
        addedAt: widget.libraryItem.addedAt,
        updatedAt: widget.libraryItem.updatedAt,
        isMissing: widget.libraryItem.isMissing,
        isInvalid: widget.libraryItem.isInvalid,
        mediaType: widget.libraryItem.mediaType,
        media: Media(
          metadata: Metadata(
            title: widget.libraryItem.media.metadata?.title,
            titleIgnorePrefix:
                widget.libraryItem.media.metadata?.titleIgnorePrefix,
            subtitle: widget.libraryItem.media.metadata?.subtitle,
            authorName: widget.libraryItem.media.metadata?.authorName,
            narratorName: widget.libraryItem.media.metadata?.narratorName,
            seriesName: widget.libraryItem.media.metadata?.seriesName,
            genres: widget.libraryItem.media.metadata?.genres,
            publishedYear:
                widget.libraryItem.media.metadata?.publishedYear != null
                    ? int.tryParse(
                        widget.libraryItem.media.metadata!.publishedYear!)
                    : null,
            publishedDate: widget.libraryItem.media.metadata?.publishedDate,
            publisher: widget.libraryItem.media.metadata?.publisher,
            description: widget.libraryItem.media.metadata?.description,
            isbn: widget.libraryItem.media.metadata?.isbn,
            asin: widget.libraryItem.media.metadata?.asin,
            language: widget.libraryItem.media.metadata?.language,
            explicit: widget.libraryItem.media.metadata?.explicit ?? false,
          ),
          coverPath: widget.libraryItem.media.coverPath,
          coverBytes: widget.libraryItem.media.coverBytes != null
              ? Uint8List.fromList(widget.libraryItem.media.coverBytes!)
              : null,
          tags: widget.libraryItem.media.tags,
          numTracks: widget.libraryItem.media.numTracks,
          numAudioFiles: widget.libraryItem.media.numAudioFiles,
          numChapters: widget.libraryItem.media.numChapters,
          numMissingParts: widget.libraryItem.media.numMissingParts,
          numInvalidAudioFiles: widget.libraryItem.media.numInvalidAudioFiles,
          duration: widget.libraryItem.media.duration,
          size: widget.libraryItem.media.size,
          ebookFileFormat: widget.libraryItem.media.ebookFileFormat,
        ),
        numFiles: widget.libraryItem.numFiles,
        size: widget.libraryItem.size,
        collapsedSeries: widget.libraryItem.collapsedSeries != null
            ? CollapsedSeries(
                id: widget.libraryItem.collapsedSeries!.id ?? '',
                name: widget.libraryItem.collapsedSeries!.name ?? '',
                nameIgnorePrefix:
                    widget.libraryItem.collapsedSeries!.nameIgnorePrefix ?? '',
                numBooks: widget.libraryItem.collapsedSeries!.numBooks,
              )
            : null,
      );

      // Trigger cover download
      await ref
          .read(coverImageProvider.notifier)
          .downloadCoverForItem(libraryItemNew);
    } catch (e) {
      if (kDebugMode) {
        print(
            '[BOOK_CARD] Error downloading cover for book ${widget.libraryItem.id}: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double progress = widget.libraryItem.media.progress == null
        ? 0
        : widget.libraryItem.media.progress!.progress!;

    // Listen to cover image state changes and update cached image if needed
    ref.listen(coverImageProvider, (previous, next) {
      if (next.isCompleted &&
          next.itemId == widget.libraryItem.itemId &&
          next.coverBytes != null) {
        // Cover download completed, update cached image
        setState(() {
          try {
            _cachedImageProvider = MemoryImage(next.coverBytes!);
          } catch (e) {
            if (kDebugMode) {
              print(
                  '[BOOK_CARD] Error creating MemoryImage from downloaded cover: $e');
            }
            _cachedImageProvider = null;
          }
        });
      }
    });

    return SizedBox(
      width: 180,
      height: 300,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // TODO: Convert LibraryItemEntity to DetailedLibraryItem
            // NavigationService.pushWithHero(
            //   context,
            //   BookDetails(
            //       item: widget.libraryItem,
            //       heroTag: 'book-cover-${widget.libraryItem.id}'),
            //   'book-cover-${widget.libraryItem.id}',
            // );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'book-cover-${widget.libraryItem.id}',
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
                        child: _cachedImageProvider != null
                            ? Image(
                                image: _cachedImageProvider!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
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
                                item.id == widget.libraryItem.itemId ||
                                item.title ==
                                    widget.libraryItem.media.metadata?.title);
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
                        widget.libraryItem.media.metadata?.title ?? "-",
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
                        widget.libraryItem.media.metadata?.authorName ?? "-",
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
