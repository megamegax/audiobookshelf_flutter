import 'dart:async';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/detailed_library_item.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/audio_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/book_chapter.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/e_book_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/library_file.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:audiobookshelf_flutter/widgets/player.dart';
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
  ConsumerState<BookDetails> createState() {
    return BookDetailsState();
  }
}

class BookDetailsState extends ConsumerState<BookDetails> {
  late AudioPlayer _audioPlayer;
  late UserModel userModel;
  late LibraryService libraryService;
  late PlayerService playerService;
  double progress = 0;
  Uint8List coverBytes = Uint8List.fromList([]);
  bool playerPrepared = false;
  bool playerLoading = false;
  late StreamSubscription subscription;
  List<BookChapter> _chapters = [];
  List<AudioFile> _audioTracks = [];
  List<EBookFile> _eBookFiles = [];
  List<FileMetadata> _libraryFiles = [];
  DetailedLibraryItem? bookDetails;
  bool _isDescriptionExpanded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = ref.read(audioPlayerProvider);
    userModel = ref.read(userModelNotifierProvider)!;
    libraryService = ref.read(libraryServiceProvider);
    playerService = ref.read(playerServiceProvider);

    subscription = _audioPlayer.positionStream.listen((event) {
      setState(() {
        progress =
            event.inMilliseconds / (_audioPlayer.duration?.inMilliseconds ?? 1);
      });
    });

    _loadBookDetails();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future<void> _loadBookDetails() async {
    try {
      final details = await libraryService.fetchDetailedLibraryItem(
        userModel,
        widget.item.itemId,
      );
      setState(() {
        bookDetails = details;
        _chapters = details.media.chapters ?? [];
        _audioTracks = details.media.audioFiles ?? [];
        _eBookFiles =
            details.media.ebookFile != null ? [details.media.ebookFile!] : [];
        _libraryFiles = details.libraryFiles ?? [];
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading book details: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 800;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      bottomSheet: _audioPlayer.audioSource != null
          ? Player(source: _audioPlayer.audioSource!)
          : null,
      appBar: AppBar(
        title: Hero(
          tag: 'bookTitleDetails${widget.item.itemId}',
          child: Text(
            widget.item.media.metadata?.title ?? "",
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        ),
        backgroundColor: colorScheme.surfaceContainerHigh,
        foregroundColor: colorScheme.onSurface,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: _audioPlayer.audioSource != null ? 100.0 : 0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: isWideScreen ? _buildWideLayout() : _buildMobileLayout(),
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Cover image
        Expanded(
          flex: 2,
          child: _buildCoverSection(),
        ),
        const SizedBox(width: 24),
        // Right side - Content
        Expanded(
          flex: 3,
          child: _buildContentSection(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCoverSection(),
        const SizedBox(height: 24),
        _buildContentSection(),
      ],
    );
  }

  Widget _buildCoverSection() {
    return Center(
      child: Hero(
        tag: widget.heroTag ?? 'book-cover-${widget.item.id}',
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
              child: _buildCoverImage(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCoverImage() {
    if (widget.item.media.coverBytes?.isNotEmpty == true) {
      return Image.memory(
        Uint8List.fromList(widget.item.media.coverBytes!),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }

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

  Widget _buildContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleSection(),
        const SizedBox(height: 24),
        _buildInfoTable(),
        const SizedBox(height: 24),
        _buildActionButtons(),
        const SizedBox(height: 24),
        _buildDescriptionSection(),
        const SizedBox(height: 32),
        _buildSections(),
      ],
    );
  }

  Widget _buildTitleSection() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final metadata = widget.item.media.metadata;

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

  Widget _buildInfoTable() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final metadata = widget.item.media.metadata;

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
            _buildInfoRow("Duration",
                durationToReadable(widget.item.media.duration ?? 0)),
            const Divider(),
            _buildInfoRow("Size", sizeToReadable(widget.item.media.size ?? 0)),
            const Divider(),
            _buildInfoRow("Progress", _formatProgress()),
          ],
        ),
      ),
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

  Widget _buildActionButtons() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDownloaded = _isBookDownloaded();

    return Row(
      children: [
        // Stream/Play button
        Expanded(
          child: FilledButton.icon(
            onPressed: _handleStreamPlay,
            icon: Icon(_audioPlayer.playing ? Icons.pause : Icons.play_arrow),
            label: Text(_audioPlayer.playing
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
        if (_eBookFiles.isNotEmpty)
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
        if (_eBookFiles.isNotEmpty) const SizedBox(width: 12),
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
  }

  Widget _buildDescriptionSection() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final description = widget.item.media.metadata?.description ?? "";

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
              _isDescriptionExpanded || !shouldShowExpandButton
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
                  setState(() {
                    _isDescriptionExpanded = !_isDescriptionExpanded;
                  });
                },
                icon: Icon(
                  _isDescriptionExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
                label: Text(_isDescriptionExpanded ? "Show less" : "Show more"),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSections() {
    return Column(
      children: [
        _buildChaptersSection(),
        const SizedBox(height: 16),
        _buildAudioTracksSection(),
        const SizedBox(height: 16),
        _buildEBookFilesSection(),
        const SizedBox(height: 16),
        _buildLibraryFilesSection(),
      ],
    );
  }

  Widget _buildChaptersSection() {
    if (_chapters.isEmpty) return const SizedBox.shrink();

    return _buildExpandableSection(
      title: "Chapters",
      icon: Icons.list,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _chapters.length,
        itemBuilder: (context, index) {
          final chapter = _chapters[index];
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

  Widget _buildAudioTracksSection() {
    if (_audioTracks.isEmpty) return const SizedBox.shrink();

    return _buildExpandableSection(
      title: "Audio Tracks",
      icon: Icons.audiotrack,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _audioTracks.length,
        itemBuilder: (context, index) {
          final track = _audioTracks[index];
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

  Widget _buildEBookFilesSection() {
    if (_eBookFiles.isEmpty) return const SizedBox.shrink();

    return _buildExpandableSection(
      title: "E-Book Files",
      icon: Icons.menu_book,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _eBookFiles.length,
        itemBuilder: (context, index) {
          final ebook = _eBookFiles[index];
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

  Widget _buildLibraryFilesSection() {
    final libraryFiles = bookDetails?.libraryFiles ?? [];

    return _buildExpandableSection(
      title: "Library Files",
      icon: Icons.folder,
      child: Column(
        children: [
          _buildFileInfo("Path", widget.item.path ?? "Unknown"),
          const Divider(),
          _buildFileInfo("Relative Path", widget.item.relPath ?? "Unknown"),
          const Divider(),
          _buildFileInfo("File Count", "${libraryFiles.length}"),
          const Divider(),
          _buildFileInfo("Total Size", sizeToReadable(widget.item.size ?? 0)),
          const Divider(),
          _buildFileInfo("Media Type", widget.item.mediaType ?? "Unknown"),
          const Divider(),
          _buildFileInfo("Added", _formatDate(widget.item.addedAt)),
          const Divider(),
          _buildFileInfo("Modified", _formatDate(widget.item.mtimeMs)),
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

  IconData _getFileTypeIcon(String? fileType) {
    switch (fileType?.toLowerCase()) {
      case 'audio':
        return Icons.audiotrack;
      case 'ebook':
        return Icons.menu_book;
      case 'image':
        return Icons.image;
      case 'metadata':
        return Icons.info;
      default:
        return Icons.insert_drive_file;
    }
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

  String _formatProgress() {
    final progressValue = (widget.item.media.progress?.progress ?? 0) * 100;
    return "${progressValue.toInt()}%";
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
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      if (playerService.currentItem() != widget.item) {
        try {
          await playerService.preparePlayer(
            widget.item,
            bookDetails,
            autoStart: true,
            onPrepared: () {
              setState(() {
                playerPrepared = true;
              });
            },
          );
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
        _audioPlayer.play();
      }
    }
  }

  void _handleRead() {
    if (_eBookFiles.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EbookReaderPage(
            ebook: _eBookFiles.first,
            libraryItem: widget.item,
            userModel: userModel,
            libraryService: libraryService,
          ),
        ),
      );
    }
  }

  void _handleDownload() {
    // Implement download logic
    if (kDebugMode) {
      print('Download button pressed');
    }
  }

  void _jumpToChapter(BookChapter chapter) {
    if (playerService.currentItem() != widget.item) {
      // If this book is not currently playing, prepare it first
      playerService.preparePlayer(
        widget.item,
        bookDetails,
        autoStart: true,
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
