import 'dart:ui';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';

import 'package:audiobookshelf_flutter/model/libraries/player/book_chapter.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/audio_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/library_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/e_book_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/detailed_library_item.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';

import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/player_state_provider.dart';
import 'package:audiobookshelf_flutter/provider/book_progress_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:audiobookshelf_flutter/pages/ebook_reader_page.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class BookDetails extends ConsumerStatefulWidget {
  final LibraryItemEntity item;
  final String? heroTag;

  const BookDetails({super.key, required this.item, this.heroTag});

  @override
  ConsumerState<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends ConsumerState<BookDetails>
    with SingleTickerProviderStateMixin {
  late AudioPlayer _audioPlayer;
  late UserModel userModel;
  late LibraryService libraryService;
  late PlayerService playerService;
  Uint8List coverBytes = Uint8List.fromList([]);
  ImageProvider? _cachedImageProvider;
  DetailedLibraryItem? _detailedItem;
  bool _isLoadingDetails = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = ref.read(audioPlayerProvider);
    userModel = ref.read(userModelNotifierProvider)!;
    libraryService = ref.read(libraryServiceProvider);
    playerService = ref.read(playerServiceProvider.notifier);

    if (kDebugMode) {
      print(
          '[BOOK_DETAILS] initState - _audioPlayer: ${_audioPlayer.hashCode}');
      print('[BOOK_DETAILS] initState - userModel: ${userModel.username}');
      print(
          '[BOOK_DETAILS] initState - libraryService: ${libraryService.hashCode}');
      print(
          '[BOOK_DETAILS] initState - playerService: ${playerService.hashCode}');
    }

    // Use the book from widget parameter
    final book = widget.item;

    // Use cover image bytes from the book if available
    if (book.media.coverBytes?.isNotEmpty == true) {
      coverBytes = Uint8List.fromList(book.media.coverBytes!);
      _cachedImageProvider = MemoryImage(coverBytes);
    }

    // Initialize the book details provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Fetch detailed book information from server
      _loadDetailedBookInfo(book);
    });
  }

  /// Load detailed book information from server
  Future<void> _loadDetailedBookInfo(LibraryItemEntity book) async {
    if (_isLoadingDetails) return;

    setState(() {
      _isLoadingDetails = true;
    });

    try {
      if (kDebugMode) {
        print('[BOOK_DETAILS] Fetching detailed info for book: ${book.itemId}');
      }

      _detailedItem =
          await libraryService.fetchDetailedLibraryItem(userModel, book.itemId);

      if (kDebugMode) {
        print('[BOOK_DETAILS] Detailed info loaded successfully');
        print(
            '[BOOK_DETAILS] Chapters: ${_detailedItem?.media.chapters?.length ?? 0}');
        print(
            '[BOOK_DETAILS] Audio files: ${_detailedItem?.media.audioFiles?.length ?? 0}');
        print(
            '[BOOK_DETAILS] Tracks: ${_detailedItem?.media.tracks?.length ?? 0}');
        print(
            '[BOOK_DETAILS] Library files: ${_detailedItem?.libraryFiles?.length ?? 0}');
        print(
            '[BOOK_DETAILS] Ebook file: ${_detailedItem?.media.ebookFile != null ? "Yes" : "No"}');
      }

      setState(() {
        _isLoadingDetails = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print('[BOOK_DETAILS] Error loading detailed info: $e');
      }
      setState(() {
        _isLoadingDetails = false;
      });
    }
  }

  /// Create a book details state using detailed information when available
  BookDetailsState _createBookDetailsState(LibraryItemEntity book) {
    // Use detailed information if available, otherwise fall back to local data
    if (_detailedItem != null) {
      if (kDebugMode) {
        print('[BOOK_DETAILS] Using detailed information from server');
      }

      // Create ebook files from detailed data
      List<EBookFile> ebookFiles = [];
      if (_detailedItem!.media.ebookFile != null) {
        ebookFiles = [_detailedItem!.media.ebookFile!];
      }

      // Use actual chapters and audio tracks from detailed data
      List<BookChapter> chapters = _detailedItem!.media.chapters ?? [];
      List<AudioFile> audioTracks = _detailedItem!.media.audioFiles ?? [];

      return BookDetailsState(
        playerLoading: false,
        hasActiveAudioSource: _audioPlayer.playing,
        chapters: chapters,
        audioTracks: audioTracks,
        eBookFiles: ebookFiles,
        bookDetails: _detailedItem,
        isDescriptionExpanded: false,
        playerPrepared: false,
      );
    } else {
      // Fallback to local data with basic information
      if (kDebugMode) {
        print('[BOOK_DETAILS] Using local data (detailed info not loaded yet)');
      }

      return _createLocalBookDetailsState(book);
    }
  }

  /// Create a simple book details state for local database usage (fallback)
  BookDetailsState _createLocalBookDetailsState(LibraryItemEntity book) {
    // Create ebook files from local data if available
    List<EBookFile> ebookFiles = [];

    if (kDebugMode) {
      print(
          '[BOOK_DETAILS] Checking ebook file format for book: ${book.media.metadata?.title}');
      print('[BOOK_DETAILS] ebookFileFormat: ${book.media.ebookFileFormat}');
      print(
          '[BOOK_DETAILS] ebookFileFormat is null: ${book.media.ebookFileFormat == null}');
      print(
          '[BOOK_DETAILS] ebookFileFormat is empty: ${book.media.ebookFileFormat?.isEmpty}');
    }

    if (book.media.ebookFileFormat != null &&
        book.media.ebookFileFormat!.isNotEmpty) {
      // Create a basic EBookFile from the local data
      final ebookFile = EBookFile(
        ino: book.ino, // Use the book's ino as the file identifier
        metadata: null, // We don't have detailed file metadata in local data
        ebookFormat: book.media.ebookFileFormat!,
        addedAt: book.addedAt,
        updatedAt: book.updatedAt,
      );
      ebookFiles = [ebookFile];
      if (kDebugMode) {
        print(
            '[BOOK_DETAILS] Created EBookFile for format: ${book.media.ebookFileFormat}');
      }
    } else {
      if (kDebugMode) {
        print(
            '[BOOK_DETAILS] No ebook file format found, ebookFiles will be empty');
      }
    }

    // Create basic chapters and audio tracks from available data
    List<BookChapter> chapters = [];
    List<AudioFile> audioTracks = [];

    // Create basic chapters if we have chapter count
    if (book.media.numChapters != null && book.media.numChapters! > 0) {
      for (int i = 0; i < book.media.numChapters!; i++) {
        final chapterStart =
            (book.media.duration ?? 0) * (i / book.media.numChapters!);
        final chapterEnd =
            (book.media.duration ?? 0) * ((i + 1) / book.media.numChapters!);
        chapters.add(BookChapter(
          id: i,
          title: 'Chapter ${i + 1}',
          start: chapterStart,
          end: chapterEnd,
        ));
      }
    }

    // Create basic audio tracks if we have track count
    if (book.media.numTracks != null && book.media.numTracks! > 0) {
      for (int i = 0; i < book.media.numTracks!; i++) {
        final trackDuration =
            (book.media.duration ?? 0) / book.media.numTracks!;
        audioTracks.add(AudioFile(
          ino: 'track_$i',
          metadata: FileMetadata(
            filename: 'Track ${i + 1}',
            ext: 'mp3', // Default extension
            path: '${book.path}/track_${i + 1}.mp3',
            relPath: 'track_${i + 1}.mp3',
            mtimeMs: book.mtimeMs,
            ctimeMs: book.ctimeMs,
            birthtimeMs: book.birthtimeMs,
            size: (book.size / book.media.numTracks!).round(),
          ),
          duration: trackDuration,
          index: i,
          format: 'mp3',
        ));
      }
    }

    return BookDetailsState(
      playerLoading: false,
      hasActiveAudioSource: _audioPlayer.playing,
      chapters: chapters,
      audioTracks: audioTracks,
      eBookFiles: ebookFiles,
      bookDetails: null, // Not needed for local usage
      isDescriptionExpanded: false,
      playerPrepared: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // Use the book from widget parameter
        final book = widget.item;
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final screenWidth = MediaQuery.of(context).size.width;
        final isWideScreen = screenWidth > 800;

        return Container(
          decoration: _cachedImageProvider != null
              ? BoxDecoration(
                  image: DecorationImage(
                    image: _cachedImageProvider!,
                    fit: BoxFit.cover,
                  ),
                )
              : null,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: colorScheme.surface.withOpacity(0.8),
              child: Stack(
                children: [
                  // Main content
                  Consumer(
                    builder: (context, ref, child) {
                      // Create state using detailed information when available
                      final bookDetailsState = _createBookDetailsState(book);

                      // Show loading indicator if we're fetching detailed information
                      if (_isLoadingDetails) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircularProgressIndicator(),
                              const SizedBox(height: 16),
                              Text(
                                'Loading detailed information...',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        );
                      }

                      return Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: isWideScreen
                                    ? _buildWideLayout(bookDetailsState, book)
                                    : _buildMobileLayout(
                                        bookDetailsState, book),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWideLayout(
      BookDetailsState bookDetailsState, LibraryItemEntity book) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Cover image
        Expanded(
          flex: 2,
          child: _buildCoverSection(book),
        ),
        const SizedBox(width: 24),
        // Right side - Content
        Expanded(
          flex: 3,
          child: _buildContentSection(bookDetailsState, book),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
      BookDetailsState bookDetailsState, LibraryItemEntity book) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCoverSection(book),
        const SizedBox(height: 24),
        _buildContentSection(bookDetailsState, book),
      ],
    );
  }

  Widget _buildCoverSection(LibraryItemEntity book) {
    return Center(
      child: Hero(
        tag: widget.heroTag ?? 'book-cover-${book.id}',
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 280,
              height: 400,
              child: _buildCoverImage(book),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCoverImage(LibraryItemEntity book) {
    // First priority: Use coverBytes if available and not empty
    if (coverBytes.isNotEmpty) {
      try {
        return Image.memory(
          coverBytes,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholder();
          },
        );
      } catch (e) {
        if (kDebugMode) {
          print('[BOOK_DETAILS] Error creating Image.memory: $e');
        }
      }
    }

    // Second priority: Use cached image provider if available
    if (_cachedImageProvider != null) {
      return Image(
        image: _cachedImageProvider!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholder();
        },
      );
    }

    // Third priority: Try to fetch cover from server API (fallback)
    if (book.media.coverPath?.isNotEmpty == true) {
      // Build the server API URL for the cover
      final serverAddress = ref.read(serverAddressProvider);
      final token = userModel.token;
      final coverUrl = '$serverAddress/api/items/${book.id}/cover';

      return Image.network(
        coverUrl,
        fit: BoxFit.cover,
        headers: {
          'Authorization': 'Bearer $token',
        },
        errorBuilder: (context, error, stackTrace) {
          if (kDebugMode) {
            print('[BOOK_DETAILS] Error loading cover from server: $error');
          }
          return _buildPlaceholder();
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      );
    }

    // Final fallback: Show placeholder
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.surfaceContainerHighest,
      child: Center(
        child: Icon(
          Icons.library_music,
          size: 80,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildContentSection(
      BookDetailsState bookDetailsState, LibraryItemEntity book) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleSection(book),
        const SizedBox(height: 24),
        _buildInfoTable(book),
        const SizedBox(height: 24),
        _buildActionButtons(bookDetailsState),
        const SizedBox(height: 24),
        _buildDescriptionSection(bookDetailsState, book),
        const SizedBox(height: 32),
        _buildSections(bookDetailsState, book),
      ],
    );
  }

  Widget _buildTitleSection(LibraryItemEntity book) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final metadata = book.media.metadata;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          metadata?.title ?? "Unknown Title",
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        // Subtitle
        if (metadata?.subtitle?.isNotEmpty == true) ...[
          Text(
            metadata!.subtitle!,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
        ],
        // Author
        Text(
          metadata?.authorName ?? "Unknown Author",
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTable(LibraryItemEntity book) {
    final metadata = book.media.metadata;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInfoRow("Narrator", metadata?.narratorName ?? "Unknown"),
            const Divider(),
            _buildInfoRow("Genres", _formatGenres(metadata?.genres)),
            const Divider(),
            _buildInfoRow(
                "Duration", durationToReadable(book.media.duration ?? 0)),
            const Divider(),
            _buildInfoRow("Size", sizeToReadable(book.media.size ?? 0)),
            const Divider(),
            _buildProgressRow(book),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressRow(LibraryItemEntity book) {
    return Consumer(
      builder: (context, ref, child) {
        final progressState = ref.watch(bookProgressProvider);
        final localProgress = book.media.progress;

        // Use progress from provider if available and matches this book, otherwise use local data
        final progress = (progressState?.itemId == book.itemId)
            ? progressState!.progress
            : (localProgress?.progress ?? 0.0);
        final currentTime = (progressState?.itemId == book.itemId)
            ? progressState!.currentTime
            : (localProgress?.currentTime ?? 0.0);
        final duration = (progressState?.itemId == book.itemId)
            ? progressState!.duration
            : (localProgress?.duration ?? book.media.duration ?? 0.0);
        final isFinished = (progressState?.itemId == book.itemId)
            ? progressState!.isFinished
            : (localProgress?.isFinished ?? false);

        final progressPercent = (progress * 100).toStringAsFixed(1);
        final currentTimeStr = durationToReadable(currentTime);
        final durationStr = durationToReadable(duration);

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Progress",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  isFinished ? "Finished" : "$progressPercent%",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isFinished
                            ? Theme.of(context).colorScheme.tertiary
                            : Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentTimeStr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                Text(
                  durationStr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(
                isFinished
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label.toUpperCase(),
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BookDetailsState bookDetailsState) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDownloaded = _isBookDownloaded();

    if (kDebugMode) {
      print(
          '[BOOK_DETAILS] _buildActionButtons - eBookFiles count: ${bookDetailsState.eBookFiles.length}');
      print(
          '[BOOK_DETAILS] _buildActionButtons - eBookFiles: ${bookDetailsState.eBookFiles}');
    }

    return Consumer(
      builder: (context, ref, child) {
        // Watch the audio player provider to get real-time updates
        final audioPlayer = ref.watch(audioPlayerProvider);

        return Row(
          children: [
            // Stream/Play button
            Expanded(
              child: FilledButton.icon(
                onPressed: () {
                  if (kDebugMode) {
                    print('[BOOK_DETAILS] Stream/Play button pressed!');
                  }
                  _handleStreamPlay();
                },
                icon:
                    Icon(audioPlayer.playing ? Icons.pause : Icons.play_arrow),
                label: Text(audioPlayer.playing
                    ? "Pause"
                    : (isDownloaded ? "Play" : "Stream")),
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Read button (if ebook available)
            if (_detailedItem?.media.ebookFile != null)
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _handleRead,
                  icon: const Icon(Icons.menu_book),
                  label: const Text("Read"),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            if (_detailedItem?.media.ebookFile != null)
              const SizedBox(width: 12),
            // Download button (only if not downloaded)
            if (!isDownloaded)
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _handleDownload,
                  icon: const Icon(Icons.download),
                  label: const Text("Download"),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildDescriptionSection(
      BookDetailsState bookDetailsState, LibraryItemEntity book) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final description = book.media.metadata?.description ?? "";

    if (description.isEmpty) {
      return const SizedBox.shrink();
    }

    // Remove HTML tags for display
    final cleanDescription = description.replaceAll(RegExp(r'<[^>]*>'), '');
    final lines = cleanDescription.split('\n');
    final shouldShowExpandButton = lines.length > 4;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              bookDetailsState.isDescriptionExpanded || !shouldShowExpandButton
                  ? cleanDescription
                  : lines.take(4).join('\n'),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
                height: 1.5,
              ),
            ),
            if (shouldShowExpandButton) ...[
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: () {
                  ref
                      .read(bookDetailsStateProvider(_audioPlayer).notifier)
                      .toggleDescription();
                },
                icon: Icon(
                  bookDetailsState.isDescriptionExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
                label: Text(bookDetailsState.isDescriptionExpanded
                    ? "Show less"
                    : "Show more"),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSections(
      BookDetailsState bookDetailsState, LibraryItemEntity book) {
    return Column(
      children: [
        _buildChaptersSection(bookDetailsState),
        const SizedBox(height: 16),
        _buildAudioTracksSection(bookDetailsState),
        const SizedBox(height: 16),
        _buildEBookFilesSection(bookDetailsState),
        const SizedBox(height: 16),
        _buildLibraryFilesSection(bookDetailsState, book),
        const SizedBox(height: 32), // Add extra spacing at the bottom
      ],
    );
  }

  Widget _buildChaptersSection(BookDetailsState bookDetailsState) {
    if (bookDetailsState.chapters.isEmpty) return const SizedBox.shrink();

    return _buildExpandableSection(
      title: "Chapters",
      icon: Icons.list,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bookDetailsState.chapters.length,
        itemBuilder: (context, index) {
          final chapter = bookDetailsState.chapters[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(chapter.title),
            subtitle: Text(
                "${durationToReadable(chapter.start)} - ${durationToReadable(chapter.end)}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  durationToReadable(chapter.end - chapter.start),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () => _jumpToChapter(chapter),
                  icon: Icon(
                    Icons.play_arrow,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  tooltip: 'Jump to chapter',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAudioTracksSection(BookDetailsState bookDetailsState) {
    if (bookDetailsState.audioTracks.isEmpty) return const SizedBox.shrink();

    return _buildExpandableSection(
      title: "Audio Tracks",
      icon: Icons.audiotrack,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bookDetailsState.audioTracks.length,
        itemBuilder: (context, index) {
          final track = bookDetailsState.audioTracks[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              child: Icon(
                Icons.audiotrack,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            title: Text(track.metadata?.filename ?? "Track ${index + 1}"),
            subtitle: Text(durationToReadable(track.duration ?? 0)),
            trailing: Text(
              track.format ?? "Unknown",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        },
      ),
    );
  }

  Widget _buildEBookFilesSection(BookDetailsState bookDetailsState) {
    if (bookDetailsState.eBookFiles.isEmpty) return const SizedBox.shrink();

    return _buildExpandableSection(
      title: "E-Book Files",
      icon: Icons.menu_book,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bookDetailsState.eBookFiles.length,
        itemBuilder: (context, index) {
          final ebook = bookDetailsState.eBookFiles[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              child: Icon(
                Icons.menu_book,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
            ),
            title: Text(ebook.metadata?.filename ?? "E-Book ${index + 1}"),
            subtitle: Text(ebook.ebookFormat),
            trailing: Text(
              sizeToReadable(ebook.metadata?.size ?? 0),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        },
      ),
    );
  }

  Widget _buildLibraryFilesSection(
      BookDetailsState bookDetailsState, LibraryItemEntity book) {
    final libraryFiles = bookDetailsState.bookDetails?.libraryFiles ?? [];

    return _buildExpandableSection(
      title: "Library Files",
      icon: Icons.folder,
      child: Column(
        children: [
          _buildFileInfo("Path", book.path),
          const Divider(),
          _buildFileInfo("Relative Path", book.relPath),
          const Divider(),
          _buildFileInfo("File Count", "${libraryFiles.length}"),
          const Divider(),
          _buildFileInfo("Total Size", sizeToReadable(book.size)),
          const Divider(),
          _buildFileInfo("Media Type", book.mediaType),
          const Divider(),
          _buildFileInfo("Added", _formatDate(book.addedAt)),
          const Divider(),
          _buildFileInfo("Modified", _formatDate(book.mtimeMs)),
          if (libraryFiles.isNotEmpty) ...[
            const Divider(),
            const SizedBox(height: 8),
            Text(
              "Individual Files:",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            ...libraryFiles.map((file) => _buildFileMetadataItem(file)),
          ],
        ],
      ),
    );
  }

  Widget _buildFileMetadataItem(FileMetadata file) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            _getFileTypeIconFromExtension(file.ext),
            size: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.filename ?? file.path?.split('/').last ?? "Unknown file",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                if (file.path != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    file.path!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 11,
                        ),
                  ),
                ],
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                sizeToReadable(file.size ?? 0),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              if (file.ext != null) ...[
                const SizedBox(height: 2),
                Text(
                  file.ext!.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  IconData _getFileTypeIconFromExtension(String? extension) {
    if (extension == null) return Icons.insert_drive_file;

    switch (extension.toLowerCase()) {
      // Audio files
      case 'mp3':
      case 'm4a':
      case 'm4b':
      case 'aac':
      case 'flac':
      case 'wav':
      case 'ogg':
        return Icons.audiotrack;

      // E-book files
      case 'epub':
      case 'mobi':
      case 'azw':
      case 'azw3':
      case 'pdf':
      case 'txt':
        return Icons.menu_book;

      // Image files
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'webp':
      case 'bmp':
        return Icons.image;

      // Metadata files
      case 'json':
      case 'xml':
      case 'opf':
      case 'nfo':
        return Icons.info;

      // Archive files
      case 'zip':
      case 'rar':
      case '7z':
        return Icons.archive;

      default:
        return Icons.insert_drive_file;
    }
  }

  Widget _buildFileInfo(String label, String value) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        leading: Icon(icon, size: 20),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        ],
      ),
    );
  }

  // Helper methods
  String _formatGenres(List<String>? genres) {
    if (genres == null || genres.isEmpty) return "Unknown";
    return genres.join(", ");
  }

  String _formatDate(int? timestamp) {
    if (timestamp == null) return "Unknown";
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return "${date.day}/${date.month}/${date.year}";
  }

  bool _isBookDownloaded() {
    // Check if book is downloaded (you'll need to implement this logic)
    // For now, return false as placeholder
    return false;
  }

  void _handleStreamPlay() async {
    // Get the current audio player state from the provider
    final currentAudioPlayer = ref.read(audioPlayerProvider);

    if (kDebugMode) {
      print('[BOOK_DETAILS] _handleStreamPlay called');
      print(
          '[BOOK_DETAILS] currentAudioPlayer.playing: ${currentAudioPlayer.playing}');
      print(
          '[BOOK_DETAILS] currentAudioPlayer.audioSource: ${currentAudioPlayer.audioSource}');
    }

    if (currentAudioPlayer.playing) {
      if (kDebugMode) {
        print('[BOOK_DETAILS] Pausing playback');
      }
      currentAudioPlayer.pause();
    } else {
      final currentItem = playerService.currentItem();
      if (kDebugMode) {
        print('[BOOK_DETAILS] Current item: ${currentItem?.itemId}');
        print('[BOOK_DETAILS] Widget item: ${widget.item.itemId}');
      }

      if (currentItem?.itemId != widget.item.itemId) {
        if (kDebugMode) {
          print('[BOOK_DETAILS] Preparing player for new item');
        }
        try {
          await playerService.preparePlayer(
            widget.item,
            autoStart: true,
            onPrepared: () {
              if (kDebugMode) {
                print('[BOOK_DETAILS] Player prepared successfully');
              }
              ref
                  .read(bookDetailsStateProvider(_audioPlayer).notifier)
                  .setPlayerState(prepared: true);
            },
          );
          if (kDebugMode) {
            print('[BOOK_DETAILS] preparePlayer completed');
            final updatedAudioPlayer = ref.read(audioPlayerProvider);
            print(
                '[BOOK_DETAILS] currentAudioPlayer.audioSource after prepare: ${updatedAudioPlayer.audioSource}');
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
      } else {
        if (kDebugMode) {
          print('[BOOK_DETAILS] Resuming playback for current item');
        }
        currentAudioPlayer.play();
      }
    }
  }

  void _handleRead() {
    // Check if we have detailed information with ebook file
    if (_detailedItem?.media.ebookFile != null) {
      // Show loading feedback
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
            ebook: _detailedItem!.media.ebookFile!,
            libraryItem: widget.item,
            userModel: userModel,
            libraryService: libraryService,
          ),
        ),
      );
    } else {
      // Show error feedback
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('No ebook file available for this book'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );

      if (kDebugMode) {
        print('[BOOK_DETAILS] _handleRead - No ebook file found');
        print('[BOOK_DETAILS] _detailedItem: ${_detailedItem != null}');
        if (_detailedItem != null) {
          print(
              '[BOOK_DETAILS] _detailedItem.media.ebookFile: ${_detailedItem!.media.ebookFile}');
        }
      }
    }
  }

  void _handleDownload() {
    // Show feedback that download is not yet implemented
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

    if (kDebugMode) {
      print('Download button pressed - showing coming soon message');
    }
  }

  void _jumpToChapter(BookChapter chapter) async {
    final currentItem = playerService.currentItem();
    if (currentItem?.itemId != widget.item.itemId) {
      // If this book is not currently playing, prepare it first
      await playerService.preparePlayer(
        widget.item,
        autoStart: false,
        onPrepared: () {
          // Jump to chapter position after player is prepared
          _seekToPosition(chapter.start);
        },
      );
    } else {
      // If this book is already playing, just jump to the chapter
      _seekToPosition(chapter.start);
    }
  }

  void _seekToPosition(double positionInSeconds) {
    final duration = _audioPlayer.duration;
    if (duration != null) {
      final position = Duration(seconds: positionInSeconds.toInt());
      _audioPlayer.seek(position);
      if (!_audioPlayer.playing) {
        _audioPlayer.play();
      }
    }
  }

  // Utility functions
  String durationToReadable(double duration) {
    if (duration == 0) return "Unknown";
    final hours = (duration / 3600).floor();
    final minutes = ((duration % 3600) / 60).floor();
    final seconds = (duration % 60).floor();

    if (hours > 0) {
      return "${hours}h ${minutes}m ${seconds}s";
    } else if (minutes > 0) {
      return "${minutes}m ${seconds}s";
    } else {
      return "${seconds}s";
    }
  }

  String sizeToReadable(int size) {
    if (size == 0) return "Unknown";
    const units = ['B', 'KB', 'MB', 'GB', 'TB'];
    int unitIndex = 0;
    double sizeInUnits = size.toDouble();

    while (sizeInUnits >= 1024 && unitIndex < units.length - 1) {
      sizeInUnits /= 1024;
      unitIndex++;
    }

    return "${sizeInUnits.toStringAsFixed(1)} ${units[unitIndex]}";
  }
}
