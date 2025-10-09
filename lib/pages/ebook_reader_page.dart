import 'dart:async';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/e_book_file.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/services/ebook_progress_service.dart';
import 'package:audiobookshelf_flutter/services/ebook_reader_service.dart';
import 'package:audiobookshelf_flutter/widgets/embeddable_pdf_reader_widget.dart';
import 'package:audiobookshelf_flutter/widgets/epub_reader_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EbookReaderPage extends ConsumerStatefulWidget {
  final EBookFile ebook;
  final LibraryItemEntity libraryItem;
  final UserModel userModel;
  final LibraryService libraryService;

  const EbookReaderPage({
    super.key,
    required this.ebook,
    required this.libraryItem,
    required this.userModel,
    required this.libraryService,
  });

  @override
  ConsumerState<EbookReaderPage> createState() => _EbookReaderPageState();
}

class _EbookReaderPageState extends ConsumerState<EbookReaderPage> {
  late EbookProgressService _ebookProgressService;
  bool _isLoading = true;
  String? _error;
  double _progress = 0.0;
  String _location = '';
  String? _localFilePath;

  @override
  void initState() {
    super.initState();
    _ebookProgressService = EbookProgressService(
      userModel: widget.userModel,
      libraryService: widget.libraryService,
      ref: ref,
    );
    _loadEbook();
  }

  Future<void> _loadEbook() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Download ebook to local storage
      final ebookReaderService = ref.read(ebookReaderServiceProvider);
      _localFilePath = await ebookReaderService.downloadEbook(
        widget.ebook,
        widget.libraryItem.itemId,
      );

      // Load saved progress
      await _loadProgress();

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print('[EBOOK_READER] Error loading ebook: $e');
      }
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _loadProgress() async {
    try {
      final progress =
          await _ebookProgressService.getProgress(widget.libraryItem.itemId);
      if (progress != null) {
        setState(() {
          _progress = progress['ebookProgress'] ?? 0.0;
          _location = progress['ebookLocation'] ?? '';
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EBOOK_READER] Error loading progress: $e');
      }
    }
  }

  Future<void> _saveProgress(double progress, String location) async {
    try {
      await _ebookProgressService.updateProgress(
        widget.libraryItem.itemId,
        progress,
        location,
      );

      setState(() {
        _progress = progress;
        _location = location;
      });

      if (kDebugMode) {
        print(
            '[EBOOK_READER] Progress saved: ${(progress * 100).toStringAsFixed(1)}% at $location');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EBOOK_READER] Error saving progress: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.ebook.metadata?.filename ?? 'Ebook'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.ebook.metadata?.filename ?? 'Ebook'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading ebook',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                _error!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadEbook,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    final filename = widget.ebook.metadata?.filename ?? '';
    final ebookReaderService = ref.read(ebookReaderServiceProvider);
    final extension = ebookReaderService.getFileExtension(filename);

    return Scaffold(
      appBar: AppBar(
        title: Text(filename),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showEbookInfo,
          ),
        ],
      ),
      body: _buildEbookReader(extension),
    );
  }

  Widget _buildEbookReader(String extension) {
    if (_localFilePath == null) {
      return const Center(
        child: Text('Ebook file not available'),
      );
    }

    switch (extension) {
      case 'pdf':
        return _buildPdfReader();
      case 'epub':
        return _buildEpubReader();
      default:
        return _buildUnsupportedReader(extension);
    }
  }

  Widget _buildPdfReader() {
    // Parse initial page from saved location
    final ebookReaderService = ref.read(ebookReaderServiceProvider);
    final initialPage = _location.isNotEmpty
        ? ebookReaderService.parsePdfLocation(_location)
        : 1;

    return EmbeddablePdfReaderWidget(
      filePath: _localFilePath!,
      initialPage: initialPage,
      onPageChanged: (pageNumber) {
        // Save progress when page changes
        final progress = _calculatePdfProgress(pageNumber);
        _saveProgress(progress, 'page_$pageNumber');
      },
      onProgressChanged: (progress) {
        // Update progress indicator
        setState(() {
          _progress = progress;
        });
      },
    );
  }

  Widget _buildEpubReader() {
    // Parse initial chapter from saved location
    final ebookReaderService = ref.read(ebookReaderServiceProvider);
    final initialChapterId = _location.isNotEmpty
        ? ebookReaderService.parseEpubLocation(_location)
        : '';

    return EpubReaderWidget(
      filePath: _localFilePath!,
      initialChapterId: initialChapterId,
      onChapterChanged: (chapterId) {
        // Save progress when chapter changes
        final progress = _calculateEpubProgress(chapterId);
        _saveProgress(progress, 'epubcfi(/6/14[$chapterId]!/4/2/1:0)');
      },
      onProgressChanged: (progress) {
        // Update progress indicator
        setState(() {
          _progress = progress;
        });
      },
    );
  }

  Widget _buildUnsupportedReader(String extension) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.description,
            size: 64,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'Unsupported Format',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'The $extension format is not yet supported',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  void _showEbookInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ebook Information'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filename: ${widget.ebook.metadata?.filename ?? 'Unknown'}'),
            const SizedBox(height: 8),
            Text('Size: ${_formatFileSize(widget.ebook.metadata?.size ?? 0)}'),
            const SizedBox(height: 8),
            Text('Progress: ${(_progress * 100).toStringAsFixed(1)}%'),
            const SizedBox(height: 8),
            Text('Location: $_location'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024)
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// Calculate PDF progress based on page number
  double _calculatePdfProgress(int pageNumber) {
    // This is a simplified calculation - in a real app you might want to
    // track total pages from the PDF document
    return (pageNumber / 100).clamp(0.0, 1.0); // Assume 100 pages max for now
  }

  /// Calculate EPUB progress based on chapter
  double _calculateEpubProgress(String chapterId) {
    // Simplified progress calculation
    // In a real implementation, you'd track the actual chapter index
    return 0.5; // Placeholder
  }
}
