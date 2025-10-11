import 'dart:ui';
import 'dart:typed_data';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/book_chapter.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/audio_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/library_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/e_book_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/detailed_library_item.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_notifier.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_state.dart';
import 'package:audiobookshelf_flutter/provider/book_details_notifier.dart';
import 'package:audiobookshelf_flutter/provider/book_details_state.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:audiobookshelf_flutter/services/download_service.dart';
import 'package:audiobookshelf_flutter/services/background_download_service.dart';
import 'package:audiobookshelf_flutter/pages/ebook_reader_page.dart';
// import 'package:audiobookshelf_flutter/widgets/expandable_text.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookDetails extends ConsumerWidget {
  final LibraryItemEntity item;
  final String? heroTag;

  const BookDetails({super.key, required this.item, this.heroTag});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // DON'T watch audioPlayerProvider here - it causes full rebuilds!
    // Only watch data that actually affects this widget

    // Watch the book details data (async)
    final bookDetailsAsync = ref.watch(bookDetailsDataProvider(item.itemId));

    // Watch the book details UI state
    final bookDetailsUI = ref.watch(bookDetailsUIProvider(item.itemId));

    // Get cover image from cached data - this is static!
    ImageProvider? coverImageProvider;
    if (item.media.coverBytes?.isNotEmpty == true) {
      coverImageProvider = MemoryImage(
        Uint8List.fromList(item.media.coverBytes!),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100), // Space for AppBar
            // Cover and basic info
            _buildCoverAndInfo(context, coverImageProvider),

            const SizedBox(height: 24),

            // Action buttons
            _buildActionButtons(context, ref, bookDetailsAsync),

            const SizedBox(height: 24),

            // Description
            _buildDescription(context, ref, bookDetailsAsync, bookDetailsUI),

            const SizedBox(height: 24),

            // Progress section
            _buildProgressSection(
              context,
              item.media.progress?.progress ?? 0.0,
            ),

            const SizedBox(height: 24),

            // Content sections
            _buildContentSections(context, ref, bookDetailsAsync),

            const SizedBox(height: 100), // Space for mini player
          ],
        ),
      ),
    );
  }

  Widget _buildCoverAndInfo(
    BuildContext context,
    ImageProvider? coverImageProvider,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cover image
        Hero(
          tag: heroTag ?? 'book-cover-${item.id}',
          child: Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: coverImageProvider != null
                  ? Image(
                      image: coverImageProvider,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          child: Icon(
                            Icons.library_music,
                            size: 80,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        );
                      },
                    )
                  : Container(
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerHighest,
                      child: Icon(
                        Icons.library_music,
                        size: 80,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
            ),
          ),
        ),

        const SizedBox(width: 24),

        // Title and metadata
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                item.media.metadata?.title ?? 'Unknown Title',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              if (item.media.metadata?.subtitle != null)
                Text(
                  item.media.metadata!.subtitle!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),

              const SizedBox(height: 16),

              // Author
              if (item.media.metadata?.authorName != null)
                Text(
                  'by ${item.media.metadata!.authorName!}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),

              const SizedBox(height: 24),

              // Metadata table
              _buildMetadataTable(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetadataTable(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: Column(
        children: [
          _buildMetadataRow(
            context,
            'Narrator',
            item.media.metadata?.narratorName ?? 'Unknown',
          ),
          _buildMetadataRow(
            context,
            'Genres',
            item.media.metadata?.genres?.join(', ') ?? 'Unknown',
          ),
          _buildMetadataRow(
            context,
            'Duration',
            _formatDuration(item.media.duration?.toInt()),
          ),
          _buildMetadataRow(context, 'Size', _formatFileSize(item.size)),
          _buildMetadataRow(
            context,
            'Progress',
            '${((item.media.progress?.progress ?? 0.0) * 100).toStringAsFixed(1)}%',
          ),
        ],
      ),
    );
  }

  Widget _buildMetadataRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<DetailedLibraryItem> bookDetailsAsync,
  ) {
    return bookDetailsAsync.when(
      data: (detailedItem) => Consumer(
        // <-- Use Consumer for localized rebuild
        builder: (context, ref, child) {
          // Only THIS button rebuilds when player state changes
          final audioPlayerState = ref.watch(audioPlayerProvider);
          final isCurrentBookPlaying = _isCurrentBookPlaying(audioPlayerState);

          return Row(
            children: [
              // Stream/Play button
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => _handleStreamPlay(context, ref),
                  icon: Icon(
                    isCurrentBookPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  label: Text(isCurrentBookPlaying ? "Pause" : "Stream"),
                  style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Read button (if ebook available)
              if (detailedItem.media.ebookFile != null)
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _handleRead(context, ref, detailedItem),
                    icon: const Icon(Icons.menu_book),
                    label: const Text("Read"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              if (detailedItem.media.ebookFile != null)
                const SizedBox(width: 12),
              // Download button (only if not downloaded)
              _buildDownloadButton(context, ref),
            ],
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text('Error: $error'),
    );
  }

  Widget _buildDescription(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<DetailedLibraryItem> bookDetailsAsync,
    BookDetailsUI bookDetailsUI,
  ) {
    return bookDetailsAsync.when(
      data: (detailedItem) {
        final description = detailedItem.media.metadata.description;
        if (description == null || description.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  height: 1.5,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (error, stack) => const SizedBox.shrink(),
    );
  }

  Widget _buildProgressSection(BuildContext context, double progress) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Progress',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${(progress * 100).toStringAsFixed(1)}%',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSections(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<DetailedLibraryItem> bookDetailsAsync,
  ) {
    return bookDetailsAsync.when(
      data: (detailedItem) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chapters
          if (detailedItem.media.chapters?.isNotEmpty == true)
            _buildCollapsibleSection(
              context,
              'Chapters',
              _buildChaptersList(context, ref, detailedItem.media.chapters!),
            ),

          // Audio Tracks
          if (detailedItem.media.audioFiles?.isNotEmpty == true)
            _buildCollapsibleSection(
              context,
              'Audio Tracks',
              _buildAudioTracksList(
                context,
                ref,
                detailedItem.media.audioFiles!,
              ),
            ),

          // E-Book Files
          if (detailedItem.media.ebookFile != null)
            _buildCollapsibleSection(
              context,
              'E-Book Files',
              _buildEBookFilesList(context, ref, detailedItem, [
                detailedItem.media.ebookFile!,
              ]),
            ),

          // Library Files
          if (detailedItem.libraryFiles?.isNotEmpty == true)
            _buildCollapsibleSection(
              context,
              'Library Files',
              _buildLibraryFilesList(context, detailedItem.libraryFiles!),
            ),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text('Error loading content: $error'),
    );
  }

  Widget _buildCollapsibleSection(
    BuildContext context,
    String title,
    Widget content,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        final isExpanded = ref
            .watch(bookDetailsUIProvider(item.itemId))
            .expandedSections
            .contains(title);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                ref
                    .read(bookDetailsUIProvider(item.itemId).notifier)
                    .toggleSection(title);
              },
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            if (isExpanded) ...[const SizedBox(height: 12), content],
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }

  Widget _buildChaptersList(
    BuildContext context,
    WidgetRef ref,
    List<BookChapter> chapters,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          return ListTile(
            title: Text(
              chapter.title,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            subtitle: Text(
              _formatDuration(chapter.start.round()),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () => _handlePlayChapter(context, ref, chapter),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAudioTracksList(
    BuildContext context,
    WidgetRef ref,
    List<AudioFile> audioFiles,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: audioFiles.length,
        itemBuilder: (context, index) {
          final audioFile = audioFiles[index];
          return ListTile(
            title: Text(
              audioFile.metadata?.filename ?? 'Unknown file',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            subtitle: Text(
              _formatDuration(audioFile.duration?.round() ?? 0),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () => _handlePlayAudioTrack(context, ref, audioFile),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEBookFilesList(
    BuildContext context,
    WidgetRef ref,
    DetailedLibraryItem detailedItem,
    List<EBookFile> ebookFiles,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: ebookFiles.length,
        itemBuilder: (context, index) {
          final ebookFile = ebookFiles[index];
          return ListTile(
            title: Text(
              ebookFile.metadata?.filename ?? 'Unknown file',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            subtitle: Text(
              ebookFile.ebookFormat.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.menu_book),
              onPressed: () => _handleRead(context, ref, detailedItem),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLibraryFilesList(
    BuildContext context,
    List<FileMetadata> libraryFiles,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: libraryFiles.length,
        itemBuilder: (context, index) {
          final libraryFile = libraryFiles[index];
          return ListTile(
            title: Text(
              libraryFile.filename ?? 'Unknown file',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            subtitle: Text(
              '${libraryFile.ext ?? 'unknown'} • ${_formatFileSize(libraryFile.size ?? 0)}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          );
        },
      ),
    );
  }

  // Helper methods
  bool _isCurrentBookPlaying(AudioPlayerState audioPlayerState) {
    return audioPlayerState.isPlaying &&
        audioPlayerState.currentItem?.itemId == item.itemId;
  }

  void _handleStreamPlay(BuildContext context, WidgetRef ref) async {
    try {
      final audioPlayerNotifier = ref.read(audioPlayerProvider.notifier);
      final playerService = ref.read(playerServiceProvider);
      final audioPlayerState = ref.read(audioPlayerProvider);

      if (_isCurrentBookPlaying(audioPlayerState)) {
        await audioPlayerNotifier.pause();
      } else {
        await playerService.preparePlayer(
          item,
          autoStart: true,
          onPrepared: () {
            if (kDebugMode) {
              print('[BOOK_DETAILS] Player prepared successfully');
            }
          },
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BOOK_DETAILS] Error preparing player: $e');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error starting playback: $e'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  void _handleRead(
    BuildContext context,
    WidgetRef ref,
    DetailedLibraryItem? detailedItem,
  ) {
    if (detailedItem?.media.ebookFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Opening ebook reader...'),
          duration: const Duration(seconds: 2),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EbookReaderPage(
            ebook: detailedItem!.media.ebookFile!,
            libraryItem: item,
            userModel: ref.read(userModelProvider)!,
            libraryService: ref.read(libraryServiceProvider),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('No ebook file available for this book'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  Future<void> _handlePlayChapter(
    BuildContext context,
    WidgetRef ref,
    BookChapter chapter,
  ) async {
    try {
      final playerService = ref.read(playerServiceProvider);
      final audioPlayerState = ref.read(audioPlayerProvider);

      // If not playing this book, start it
      if (!_isCurrentBookPlaying(audioPlayerState)) {
        await playerService.preparePlayer(
          item,
          autoStart: false,
          onPrepared: () {
            if (kDebugMode) {
              print(
                '[BOOK_DETAILS] Player prepared for chapter: ${chapter.title}',
              );
            }
          },
        );
      }

      // Seek to chapter start
      await playerService.seekTo(chapter.start);
      await ref.read(audioPlayerProvider.notifier).play();

      // Show success feedback
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Playing chapter: ${chapter.title}'),
            duration: const Duration(seconds: 2),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BOOK_DETAILS] Error playing chapter: $e');
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error playing chapter: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _handlePlayAudioTrack(
    BuildContext context,
    WidgetRef ref,
    AudioFile audioFile,
  ) async {
    try {
      final playerService = ref.read(playerServiceProvider);
      final audioPlayerState = ref.read(audioPlayerProvider);

      // If not playing this book, start it
      if (!_isCurrentBookPlaying(audioPlayerState)) {
        await playerService.preparePlayer(
          item,
          autoStart: false,
          onPrepared: () {
            if (kDebugMode) {
              print(
                '[BOOK_DETAILS] Player prepared for audio track: ${audioFile.metadata?.filename}',
              );
            }
          },
        );
      }

      // For audio files, we need to find the corresponding track
      // Since AudioFile doesn't have startOffset, we'll start from the beginning
      // and let the user navigate to the specific track
      await ref.read(audioPlayerProvider.notifier).play();

      // Show success feedback
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Playing audio file: ${audioFile.metadata?.filename ?? 'Unknown'}',
            ),
            duration: const Duration(seconds: 2),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BOOK_DETAILS] Error playing audio track: $e');
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error playing audio track: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _handleDownload(BuildContext context, WidgetRef ref) async {
    try {
      final backgroundDownloadService = ref.read(backgroundDownloadServiceProvider);
      final userModel = ref.read(userModelProvider);
      final libraryService = ref.read(libraryServiceProvider);

      if (userModel == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User not logged in'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      // Get playback session for tracks info
      final session = await libraryService.playBook(userModel, item);
      
      // Start background download
      await backgroundDownloadService.downloadAllTracksInBackground(
        userModel: userModel,
        playbackSession: session,
        libraryItemId: item.itemId,
        libraryItemTitle: item.media.metadata?.title ?? 'Unknown Book',
      );

      // Show success feedback
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Download started: ${item.media.metadata?.title ?? 'Unknown Book'}',
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            action: SnackBarAction(
              label: 'View Downloads',
              onPressed: () {
                // TODO: Navigate to downloads page
              },
            ),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BOOK_DETAILS] Error starting download: $e');
      }
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Download failed: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Widget _buildDownloadButton(BuildContext context, WidgetRef ref) {
    return FutureBuilder<bool>(
      future: _isBookDownloaded(ref),
      builder: (context, snapshot) {
        final isDownloaded = snapshot.data ?? false;
        if (isDownloaded) {
          return const SizedBox.shrink();
        }

        // Watch background download service for progress
        final backgroundDownloadService = ref.watch(backgroundDownloadServiceProvider);
        final activeDownloads = backgroundDownloadService.activeDownloads;
        
        // Check if this book is currently downloading
        final isDownloading = activeDownloads.values.any(
          (task) => task.libraryItemId == item.itemId,
        );
        
        if (isDownloading) {
          // Find the download task for this book
          final downloadTasks = activeDownloads.values.where(
            (task) => task.libraryItemId == item.itemId,
          ).toList();
          
          if (downloadTasks.isEmpty) {
            // Fallback to regular download button if no task found
            return Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _handleDownload(context, ref),
                icon: const Icon(Icons.download),
                label: const Text("Download"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            );
          }
          
          final downloadTask = downloadTasks.first;
          
          return Expanded(
            child: Column(
              children: [
                OutlinedButton.icon(
                  onPressed: null, // Disabled while downloading
                  icon: const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  label: Text("Downloading ${(downloadTask.progress * 100).toInt()}%"),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: downloadTask.progress,
                  backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          );
        }

        return Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _handleDownload(context, ref),
            icon: const Icon(Icons.download),
            label: const Text("Download"),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        );
      },
    );
  }

  Future<bool> _isBookDownloaded(WidgetRef ref) async {
    try {
      final downloadService = ref.read(downloadServiceProvider);
      final downloadedItems = await downloadService.getDownloadedItems();
      
      // Check if this book is in the downloaded items
      final bookTitle = item.media.metadata?.title ?? '';
      final sanitizedTitle = _sanitizeFilename(bookTitle);
      
      return downloadedItems.any((downloadedItem) => 
        downloadedItem.id == sanitizedTitle || 
        downloadedItem.title == sanitizedTitle
      );
    } catch (e) {
      if (kDebugMode) {
        print('[BOOK_DETAILS] Error checking download status: $e');
      }
      return false;
    }
  }

  String _sanitizeFilename(String filename) {
    // Remove invalid characters for file system
    return filename.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_').trim();
  }

  String _formatDuration(int? seconds) {
    if (seconds == null) return 'Unknown';
    final duration = Duration(seconds: seconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final secs = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m ${secs}s';
    } else if (minutes > 0) {
      return '${minutes}m ${secs}s';
    } else {
      return '${secs}s';
    }
  }

  String _formatFileSize(int size) {
    if (size < 1024) return '${size} B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    if (size < 1024 * 1024 * 1024)
      return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(size / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}
