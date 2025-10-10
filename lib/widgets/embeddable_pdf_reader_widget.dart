import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdfrx/pdfrx.dart';

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
  late final PdfViewerController _controller;
  final GlobalKey _pdfViewerKey = GlobalKey();
  Widget? _cachedPdfViewer; // Cached PdfViewer to prevent recreation
  String? _cachedFilePath; // Track file path changes
  int _currentPage = 1;
  int _totalPages = 0;
  bool _isLoading = true;
  String? _error;
  bool _isReady = false;
  bool _isNavigatingProgrammatically = false;
  bool _hasInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = PdfViewerController();
    _currentPage = widget.initialPage;
    if (kDebugMode) {
      print(
          '[EMBEDDABLE_PDF_READER] initState: filePath=${widget.filePath}, initialPage=$_currentPage');
      // Check if file exists
      final file = File(widget.filePath);
      print('[EMBEDDABLE_PDF_READER] File exists: ${file.existsSync()}');
      if (file.existsSync()) {
        print('[EMBEDDABLE_PDF_READER] File size: ${file.lengthSync()} bytes');
      }
    }
  }

  @override
  void didUpdateWidget(EmbeddablePdfReaderWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset initialization if file path changes
    if (oldWidget.filePath != widget.filePath) {
      _hasInitialized = false;
      _isLoading = true;
      _isReady = false;
      _totalPages = 0;
      _error = null;
      _currentPage = widget.initialPage;
    }
  }

  @override
  void dispose() {
    if (kDebugMode) {
      print('[EMBEDDABLE_PDF_READER] Disposing widget');
    }
    super.dispose();
  }

  Widget _getCachedPdfViewer() {
    // Only recreate PdfViewer if the file path changes or it hasn't been created yet
    if (_cachedPdfViewer == null || _cachedFilePath != widget.filePath) {
      _cachedFilePath = widget.filePath;
      _hasInitialized = false; // Reset initialization for new file
      _cachedPdfViewer = _buildPdfViewer();
      if (kDebugMode) {
        print(
            '[EMBEDDABLE_PDF_READER] Created new cached PDF viewer for: ${widget.filePath}');
      }
    }
    return _cachedPdfViewer!;
  }

  Widget _buildPdfViewer() {
    return PdfViewer.file(
      widget.filePath,
      key: _pdfViewerKey,
      controller: _controller,
      params: PdfViewerParams(
        // Page spacing and visual settings
        margin: 16.0,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,

        // Scroll physics for better user experience (from documentation)
        scrollPhysics: const BouncingScrollPhysics(),

        // Enable keyboard navigation for desktop
        enableKeyboardNavigation: true,

        // Performance optimizations
        limitRenderingCache: true,
        maxImageBytesCachedOnMemory: 100 * 1024 * 1024, // 100MB

        // Text selection configuration to prevent crashes
        textSelectionParams: const PdfTextSelectionParams(
          enabled: false, // Disable text selection to prevent null check errors
        ),

        // Document ready callback with error handling
        onViewerReady: (controller, document) {
          try {
            // Prevent multiple initializations
            if (_hasInitialized) {
              if (kDebugMode) {
                print(
                    '[EMBEDDABLE_PDF_READER] Document already initialized, skipping');
              }
              return;
            }

            if (kDebugMode) {
              print(
                  '[EMBEDDABLE_PDF_READER] Document loaded with ${document.pages.length} pages');
            }

            _hasInitialized = true;

            // Update state safely without triggering rebuilds
            if (mounted) {
              _totalPages = document.pages.length;
              _isLoading = false;
              _isReady = true;

              // Navigate to initial page if specified
              if (widget.initialPage > 1 &&
                  widget.initialPage <= document.pages.length) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    _goToPage(widget.initialPage);
                  }
                });
              } else {
                // Notify parent about current page
                widget.onPageChanged?.call(_currentPage);
                if (_totalPages > 0) {
                  final progress = _currentPage / _totalPages;
                  widget.onProgressChanged?.call(progress);
                }
              }

              // Update UI state with minimal impact
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    // Minimal state change to update UI
                  });
                }
              });
            }
          } catch (e) {
            if (kDebugMode) {
              print('[EMBEDDABLE_PDF_READER] Error in onViewerReady: $e');
            }
            if (mounted) {
              setState(() {
                _error = 'Failed to load PDF: $e';
                _isLoading = false;
              });
            }
          }
        },

        // Page change callback (user scrolling)
        onPageChanged: (pageNumber) {
          if (pageNumber != null &&
              pageNumber != _currentPage &&
              !_isNavigatingProgrammatically) {
            if (kDebugMode) {
              print('[EMBEDDABLE_PDF_READER] Page changed to: $pageNumber');
            }

            _currentPage = pageNumber;
            widget.onPageChanged?.call(pageNumber);

            // Update progress
            if (_totalPages > 0) {
              final progress = pageNumber / _totalPages;
              widget.onProgressChanged?.call(progress);
            }
          }
        },

        // Use custom error handling and loading indicators
        // (removed problematic callbacks)
      ),
    );
  }

  void _goToPage(int pageNumber) {
    if (pageNumber >= 1 && pageNumber <= _totalPages && _isReady) {
      if (kDebugMode) {
        print('[EMBEDDABLE_PDF_READER] Navigating to page $pageNumber');
      }

      if (pageNumber != _currentPage) {
        _isNavigatingProgrammatically = true;

        try {
          // Navigate immediately without waiting for UI updates
          _controller.goToPage(pageNumber: pageNumber);
          _currentPage = pageNumber;

          // Update callbacks immediately
          widget.onPageChanged?.call(pageNumber);
          if (_totalPages > 0) {
            final progress = pageNumber / _totalPages;
            widget.onProgressChanged?.call(progress);
          }

          HapticFeedback.lightImpact();
        } catch (e) {
          if (kDebugMode) {
            print('[EMBEDDABLE_PDF_READER] Navigation failed: $e');
          }
        } finally {
          _isNavigatingProgrammatically = false;
        }
      }
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
    if (kDebugMode) {
      print(
          '[EMBEDDABLE_PDF_READER] build: _isLoading=$_isLoading, _isReady=$_isReady, _error=$_error, _totalPages=$_totalPages');
    }

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
        // Use cached PDF Viewer to prevent rebuilds
        _getCachedPdfViewer(),

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
                color: Theme.of(context)
                    .colorScheme
                    .surface
                    .withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .outline
                      .withValues(alpha: 0.2),
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
