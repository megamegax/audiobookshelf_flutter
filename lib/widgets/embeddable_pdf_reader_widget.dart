import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class EmbeddablePdfReaderWidget extends StatefulWidget {
  final String filePath;
  final int initialPage;
  final Function(int pageNumber)? onPageChanged;
  final Function(double progress)? onProgressChanged;

  const EmbeddablePdfReaderWidget({
    super.key,
    required this.filePath,
    this.initialPage = 1,
    this.onPageChanged,
    this.onProgressChanged,
  });

  @override
  State<EmbeddablePdfReaderWidget> createState() =>
      _EmbeddablePdfReaderWidgetState();
}

class _EmbeddablePdfReaderWidgetState extends State<EmbeddablePdfReaderWidget> {
  late PDFViewController _pdfViewController;
  int _currentPage = 1;
  int _totalPages = 0;
  bool _isLoading = true;
  String? _error;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
  }

  void _goToPage(int pageNumber) {
    if (pageNumber >= 1 && pageNumber <= _totalPages && _isReady) {
      _pdfViewController.setPage(pageNumber - 1); // Convert to 0-based indexing
      HapticFeedback.lightImpact();
    }
  }

  void _showPageNavigator() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Go to Page'),
        content: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Page (1-$_totalPages)',
            border: const OutlineInputBorder(),
          ),
          onSubmitted: (value) {
            final pageNumber = int.tryParse(value);
            if (pageNumber != null &&
                pageNumber >= 1 &&
                pageNumber <= _totalPages) {
              _goToPage(pageNumber);
              Navigator.of(context).pop();
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final pageNumber = int.tryParse((context as Element)
                      .findAncestorWidgetOfExactType<TextField>()
                      ?.controller
                      ?.text ??
                  '1');
              if (pageNumber != null &&
                  pageNumber >= 1 &&
                  pageNumber <= _totalPages) {
                _goToPage(pageNumber);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Go'),
          ),
        ],
      ),
    );
  }

  void _openWithExternalApp() {
    if (Platform.isAndroid) {
      Process.run('am', [
        'start',
        '-a',
        'android.intent.action.VIEW',
        '-d',
        'file://${widget.filePath}'
      ]);
    } else if (Platform.isIOS) {
      Process.run('open', [widget.filePath]);
    } else if (Platform.isLinux) {
      Process.run('xdg-open', [widget.filePath]);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Center(
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
              'Error loading PDF',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                _error!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _openWithExternalApp,
              icon: const Icon(Icons.open_in_new),
              label: const Text('Open with External App'),
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        // PDF Viewer
        PDFView(
          filePath: widget.filePath,
          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: false,
          pageFling: true,
          pageSnap: true,
          onRender: (pages) {
            setState(() {
              _totalPages = pages ?? 0;
              _isLoading = false;
            });
          },
          onViewCreated: (PDFViewController controller) {
            _pdfViewController = controller;
            if (_currentPage > 1) {
              _goToPage(_currentPage);
            }
          },
          onPageChanged: (int? page, int? total) {
            if (page != null) {
              setState(() {
                _currentPage = page + 1; // Convert from 0-based to 1-based
              });
              widget.onPageChanged?.call(_currentPage);

              // Calculate progress
              if (total != null && total > 0) {
                final progress = _currentPage / total;
                widget.onProgressChanged?.call(progress);
              }
            }
          },
          onError: (error) {
            setState(() {
              _error = error.toString();
              _isLoading = false;
            });
          },
          onPageError: (page, error) {
            setState(() {
              _error = 'Error loading page $page: ${error.toString()}';
              _isLoading = false;
            });
          },
        ),

        // Loading indicator
        if (_isLoading)
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Loading PDF...',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),

        // Page indicator overlay
        if (!_isLoading && _totalPages > 0)
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Page $_currentPage of $_totalPages',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _currentPage > 1
                            ? () => _goToPage(_currentPage - 1)
                            : null,
                        icon: const Icon(Icons.chevron_left),
                        iconSize: 20,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                      IconButton(
                        onPressed: _currentPage < _totalPages
                            ? () => _goToPage(_currentPage + 1)
                            : null,
                        icon: const Icon(Icons.chevron_right),
                        iconSize: 20,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                      IconButton(
                        onPressed: _showPageNavigator,
                        icon: const Icon(Icons.more_horiz),
                        iconSize: 20,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
