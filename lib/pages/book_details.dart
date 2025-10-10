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
    // Watch the audio player state
    final audioPlayerState = ref.watch(audioPlayerProvider);

    // Watch the book details data (async)
    final bookDetailsAsync = ref.watch(bookDetailsDataProvider(item.itemId));

    // Watch the book details UI state
    final bookDetailsUI = ref.watch(bookDetailsUIProvider(item.itemId));

    // Get cover image from cached data
    Uint8List? coverBytes;
    ImageProvider? coverImageProvider;

    if (item.media.coverBytes?.isNotEmpty == true) {
      coverBytes = Uint8List.fromList(item.media.coverBytes!);
      coverImageProvider = MemoryImage(coverBytes);
    }

    return Stack(
      children: [
        // Blurred background
        if (coverImageProvider != null)
          Positioned.fill(
            child: Image(image: coverImageProvider, fit: BoxFit.cover),
          ),
        if (coverImageProvider != null)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),
          ),

        // Main content
        SingleChildScrollView(
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
                _buildActionButtons(
                  context,
                  ref,
                  bookDetailsAsync,
                  audioPlayerState,
                ),

                const SizedBox(height: 24),

                // Description
                _buildDescription(
                  context,
                  ref,
                  bookDetailsAsync,
                  bookDetailsUI,
                ),

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
        ),
      ],
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
    AudioPlayerState audioPlayerState,
  ) {
    return bookDetailsAsync.when(
      data: (detailedItem) => Row(
        children: [
          // Stream/Play button
          Expanded(
            child: FilledButton.icon(
              onPressed: () => _handleStreamPlay(context, ref),
              icon: Icon(
                _isCurrentBookPlaying(audioPlayerState)
                    ? Icons.pause
                    : Icons.play_arrow,
              ),
              label: Text(
                _isCurrentBookPlaying(audioPlayerState) ? "Pause" : "Stream",
              ),
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
          if (detailedItem.media.ebookFile != null) const SizedBox(width: 12),
          // Download button (only if not downloaded)
          if (!_isBookDownloaded())
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _handleDownload(context),
                icon: const Icon(Icons.download),
                label: const Text("Download"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
        ],
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
        final description = detailedItem.media.metadata?.description;
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
              _buildChaptersList(context, detailedItem.media.chapters!),
            ),

          // Audio Tracks
          if (detailedItem.media.audioFiles?.isNotEmpty == true)
            _buildCollapsibleSection(
              context,
              'Audio Tracks',
              _buildAudioTracksList(context, detailedItem.media.audioFiles!),
            ),

          // E-Book Files
          if (detailedItem.media.ebookFile != null)
            _buildCollapsibleSection(
              context,
              'E-Book Files',
              _buildEBookFilesList(context, [detailedItem.media.ebookFile!]),
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

  Widget _buildChaptersList(BuildContext context, List<BookChapter> chapters) {
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
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Play chapter ${chapter.title} not yet implemented.',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildAudioTracksList(
    BuildContext context,
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
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Play audio file ${audioFile.metadata?.filename} not yet implemented.',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildEBookFilesList(
    BuildContext context,
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
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Ebook reader not yet implemented.'),
                  ),
                );
              },
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

  void _handleDownload(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Download functionality is coming soon!'),
        duration: const Duration(seconds: 3),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        action: SnackBarAction(
          label: 'OK',
          textColor: Theme.of(context).colorScheme.onTertiary,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  bool _isBookDownloaded() {
    // TODO: Implement download check
    return false;
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
