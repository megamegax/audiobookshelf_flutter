import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfReaderWidget extends StatefulWidget {
  final String filePath;
  final int initialPage;
  final Function(int pageNumber)? onPageChanged;
  final Function(double progress)? onProgressChanged;

  const PdfReaderWidget({
    super.key,
    required this.filePath,
    this.initialPage = 1,
    this.onPageChanged,
    this.onProgressChanged,
  });

  @override
  State<PdfReaderWidget> createState() => _PdfReaderWidgetState();
}

class _PdfReaderWidgetState extends State<PdfReaderWidget> {
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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Current page: $_currentPage of $_totalPages'),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Page number (1-$_totalPages)',
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
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // This will be handled by the TextField onSubmitted
            },
            child: const Text('Go'),
          ),
        ],
      ),
    );
  }

  void _openWithExternalApp() {
    // Try to open the PDF with the system's default PDF viewer
    final file = File(widget.filePath);
    if (file.existsSync()) {
      // On macOS, we can use the 'open' command
      if (Platform.isMacOS) {
        Process.run('open', [widget.filePath]);
      } else if (Platform.isWindows) {
        Process.run('start', [widget.filePath], runInShell: true);
      } else if (Platform.isLinux) {
        Process.run('xdg-open', [widget.filePath]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('PDF Error'),
          actions: [
            IconButton(
              onPressed: _openWithExternalApp,
              icon: const Icon(Icons.open_in_new),
              tooltip: 'Open with External App',
            ),
          ],
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
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Page $_currentPage of $_totalPages'),
        actions: [
          IconButton(
            onPressed: _showPageNavigator,
            icon: const Icon(Icons.list),
            tooltip: 'Go to Page',
          ),
          IconButton(
            onPressed: _openWithExternalApp,
            icon: const Icon(Icons.open_in_new),
            tooltip: 'Open with External App',
          ),
        ],
      ),
      body: Stack(
        children: [
          // PDF Viewer
          PDFView(
            filePath: widget.filePath,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: true,
            pageFling: true,
            pageSnap: true,
            onRender: (pages) {
              setState(() {
                _totalPages = pages ?? 0;
                _isLoading = false;
                _isReady = true;
              });

              // Navigate to initial page if specified
              if (widget.initialPage > 1 &&
                  widget.initialPage <= (pages ?? 0)) {
                // Use a small delay to ensure the PDF is fully rendered
                Future.delayed(const Duration(milliseconds: 500), () {
                  if (_pdfViewController != null) {
                    _pdfViewController!.setPage(widget.initialPage -
                        1); // PDFView uses 0-based indexing
                  }
                });
              }
            },
            onViewCreated: (PDFViewController controller) {
              _pdfViewController = controller;
            },
            onPageChanged: (page, total) {
              setState(() {
                _currentPage = (page ?? 0) + 1; // Convert to 1-based indexing
                _totalPages = total ?? 0;
              });

              // Calculate progress
              final progress = _currentPage / _totalPages;
              widget.onProgressChanged?.call(progress);

              // Notify parent
              widget.onPageChanged?.call(_currentPage);
            },
            onError: (error) {
              setState(() {
                _error = error.toString();
                _isLoading = false;
              });
            },
            onPageError: (page, error) {
              setState(() {
                _error = 'Error loading page $page: $error';
                _isLoading = false;
              });
            },
          ),

          // Loading indicator
          if (_isLoading)
            Container(
              color: Theme.of(context).colorScheme.surface,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading PDF...'),
                  ],
                ),
              ),
            ),

          // Page navigation overlay
          if (_isReady && _totalPages > 0)
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
                    // Previous page button
                    IconButton(
                      onPressed: _currentPage > 1
                          ? () => _goToPage(_currentPage - 1)
                          : null,
                      icon: const Icon(Icons.chevron_left),
                      tooltip: 'Previous page',
                    ),

                    // Page info
                    GestureDetector(
                      onTap: _showPageNavigator,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '$_currentPage / $_totalPages',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),

                    // Next page button
                    IconButton(
                      onPressed: _currentPage < _totalPages
                          ? () => _goToPage(_currentPage + 1)
                          : null,
                      icon: const Icon(Icons.chevron_right),
                      tooltip: 'Next page',
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
