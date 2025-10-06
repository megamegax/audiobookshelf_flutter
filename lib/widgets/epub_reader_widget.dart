import 'dart:io';
import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

class EpubReaderWidget extends StatefulWidget {
  final String filePath;
  final String initialChapterId;
  final Function(String chapterId)? onChapterChanged;
  final Function(double progress)? onProgressChanged;

  const EpubReaderWidget({
    super.key,
    required this.filePath,
    this.initialChapterId = '',
    this.onChapterChanged,
    this.onProgressChanged,
  });

  @override
  State<EpubReaderWidget> createState() => _EpubReaderWidgetState();
}

class EpubChapter {
  final String id;
  final String title;
  final String content;

  EpubChapter({
    required this.id,
    required this.title,
    required this.content,
  });
}

class _EpubReaderWidgetState extends State<EpubReaderWidget> {
  List<EpubChapter> _chapters = [];
  String _currentChapterId = '';
  int _currentChapterIndex = 0;
  String _currentContent = '';
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _currentChapterId = widget.initialChapterId;
    _loadEpub();
  }

  Future<void> _loadEpub() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final file = File(widget.filePath);
      if (!file.existsSync()) {
        throw Exception('EPUB file not found');
      }

      final bytes = await file.readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);

      // Find the OPF file
      String? opfPath;
      for (final file in archive) {
        if (file.name.endsWith('.opf')) {
          opfPath = file.name;
          break;
        }
      }

      if (opfPath == null) {
        throw Exception('OPF file not found in EPUB');
      }

      // Read the OPF file
      final opfFile = archive.firstWhere((file) => file.name == opfPath);
      final opfContent = utf8.decode(opfFile.content as List<int>);
      final opfDoc = XmlDocument.parse(opfContent);

      // Extract chapters
      _chapters = _extractChapters(opfDoc, archive);

      if (_chapters.isEmpty) {
        throw Exception('No chapters found in EPUB');
      }

      // Load initial chapter
      await _loadInitialChapter();

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  List<EpubChapter> _extractChapters(XmlDocument opfDoc, Archive archive) {
    final chapters = <EpubChapter>[];

    try {
      // Find manifest items
      final manifestItems = opfDoc.findAllElements('item');

      for (final item in manifestItems) {
        final id = item.getAttribute('id') ?? '';
        final href = item.getAttribute('href') ?? '';
        final mediaType = item.getAttribute('media-type') ?? '';

        // Look for HTML/XHTML content
        if (mediaType.contains('html') || mediaType.contains('xhtml')) {
          // Find the file in the archive
          final file = archive.firstWhere(
            (f) => f.name.endsWith(href),
            orElse: () => ArchiveFile('', 0, []),
          );

          if (file.size > 0) {
            final content = utf8.decode(file.content as List<int>);
            final title = _extractTitleFromContent(content);

            chapters.add(EpubChapter(
              id: id,
              title: title,
              content: content,
            ));
          }
        }
      }
    } catch (e) {
      // If parsing fails, create a simple chapter from the first HTML file
      final htmlFiles = archive.where((file) =>
          file.name.endsWith('.html') || file.name.endsWith('.xhtml'));

      if (htmlFiles.isNotEmpty) {
        final firstFile = htmlFiles.first;
        final content = utf8.decode(firstFile.content as List<int>);
        chapters.add(EpubChapter(
          id: 'chapter1',
          title: 'Chapter 1',
          content: content,
        ));
      }
    }

    return chapters;
  }

  String _extractTitleFromContent(String content) {
    try {
      final doc = XmlDocument.parse(content);
      final titleElement = doc.findAllElements('title').firstOrNull;
      if (titleElement != null) {
        return titleElement.innerText.trim();
      }
    } catch (e) {
      // If XML parsing fails, try to extract title from HTML
      final titleMatch =
          RegExp(r'<title[^>]*>(.*?)</title>', caseSensitive: false)
              .firstMatch(content);
      if (titleMatch != null) {
        return titleMatch.group(1)?.trim() ?? 'Chapter';
      }
    }
    return 'Chapter';
  }

  Future<void> _loadInitialChapter() async {
    if (_chapters.isEmpty) return;

    // Find initial chapter or use first chapter
    int initialIndex = 0;
    if (widget.initialChapterId.isNotEmpty) {
      final foundIndex = _chapters.indexWhere(
        (chapter) => chapter.id == widget.initialChapterId,
      );
      if (foundIndex != -1) {
        initialIndex = foundIndex;
      }
    }

    await _loadChapter(initialIndex);
  }

  Future<void> _loadChapter(int index) async {
    if (index < 0 || index >= _chapters.length) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final chapter = _chapters[index];
      final content = _cleanHtmlContent(chapter.content);

      setState(() {
        _currentChapterIndex = index;
        _currentChapterId = chapter.id;
        _currentContent = content;
        _isLoading = false;
      });

      // Calculate progress
      final progress = (index + 1) / _chapters.length;
      widget.onProgressChanged?.call(progress);

      // Notify parent
      widget.onChapterChanged?.call(_currentChapterId);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _currentContent = '<p>Error loading chapter: $e</p>';
      });
    }
  }

  String _cleanHtmlContent(String content) {
    // Simple HTML cleaning - remove scripts, styles, etc.
    String cleaned = content
        .replaceAll(
            RegExp(r'<script[^>]*>.*?</script>',
                caseSensitive: false, dotAll: true),
            '')
        .replaceAll(
            RegExp(r'<style[^>]*>.*?</style>',
                caseSensitive: false, dotAll: true),
            '')
        .replaceAll(RegExp(r'<link[^>]*>', caseSensitive: false), '')
        .replaceAll(RegExp(r'<meta[^>]*>', caseSensitive: false), '');

    return cleaned;
  }

  void _goToChapter(int index) {
    _loadChapter(index);
  }

  void _goToNextChapter() {
    if (_currentChapterIndex < _chapters.length - 1) {
      _goToChapter(_currentChapterIndex + 1);
    }
  }

  void _goToPreviousChapter() {
    if (_currentChapterIndex > 0) {
      _goToChapter(_currentChapterIndex - 1);
    }
  }

  void _showChapterNavigator() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Table of Contents',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _chapters.length,
                itemBuilder: (context, index) {
                  final chapter = _chapters[index];
                  final isSelected = index == _currentChapterIndex;

                  return ListTile(
                    title: Text(
                      chapter.title,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : null,
                      ),
                    ),
                    selected: isSelected,
                    onTap: () {
                      _goToChapter(index);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_error != null) {
      return Scaffold(
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
                'Error loading EPUB',
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
                onPressed: _loadEpub,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // EPUB Content
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: HtmlView(
              data: _currentContent,
            ),
          ),

          // Chapter navigation overlay
          if (_chapters.isNotEmpty)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Previous chapter button
                    IconButton(
                      onPressed: _currentChapterIndex > 0
                          ? _goToPreviousChapter
                          : null,
                      icon: const Icon(Icons.chevron_left),
                      tooltip: 'Previous chapter',
                    ),

                    // Chapter info and navigation
                    GestureDetector(
                      onTap: _showChapterNavigator,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _chapters[_currentChapterIndex].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '${_currentChapterIndex + 1} / ${_chapters.length}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Next chapter button
                    IconButton(
                      onPressed: _currentChapterIndex < _chapters.length - 1
                          ? _goToNextChapter
                          : null,
                      icon: const Icon(Icons.chevron_right),
                      tooltip: 'Next chapter',
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Simple HTML view widget
class HtmlView extends StatelessWidget {
  final String data;

  const HtmlView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Simple HTML rendering - in a real app you'd use flutter_html
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        _stripHtmlTags(data),
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.6,
            ),
      ),
    );
  }

  String _stripHtmlTags(String html) {
    return html
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .trim();
  }
}
