import 'package:audiobookshelf_flutter/model/bookmark.dart';
import 'package:audiobookshelf_flutter/provider/bookmark_provider.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarksDialog extends ConsumerStatefulWidget {
  final String libraryItemId;
  final String bookTitle;

  const BookmarksDialog({
    super.key,
    required this.libraryItemId,
    required this.bookTitle,
  });

  @override
  ConsumerState<BookmarksDialog> createState() => _BookmarksDialogState();
}

class _BookmarksDialogState extends ConsumerState<BookmarksDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  Bookmark? _editingBookmark;

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bookmarksAsync = ref.watch(bookmarkProvider(widget.libraryItemId));
    final bookmarkNotifier = ref.read(
      bookmarkProvider(widget.libraryItemId).notifier,
    );

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bookmarks',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          widget.bookTitle,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer
                                    .withOpacity(0.8),
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: bookmarksAsync.when(
                data: (bookmarks) =>
                    _buildBookmarksList(bookmarks, bookmarkNotifier),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Failed to load bookmarks',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        error.toString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => bookmarkNotifier.refresh(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Add bookmark section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withOpacity(0.2),
                  ),
                ),
              ),
              child: _buildAddBookmarkSection(bookmarkNotifier),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookmarksList(
    List<Bookmark> bookmarks,
    BookmarkNotifier bookmarkNotifier,
  ) {
    if (bookmarks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_border,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'No bookmarks yet',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add your first bookmark using the form below',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: bookmarks.length,
      itemBuilder: (context, index) {
        final bookmark = bookmarks[index];
        return _buildBookmarkItem(bookmark, bookmarkNotifier);
      },
    );
  }

  Widget _buildBookmarkItem(
    Bookmark bookmark,
    BookmarkNotifier bookmarkNotifier,
  ) {
    final timeFormatted = _formatTime(bookmark.time);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Text(
            timeFormatted,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          bookmark.title,
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: bookmark.note?.isNotEmpty == true
            ? Text(bookmark.note!, maxLines: 2, overflow: TextOverflow.ellipsis)
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => _jumpToBookmark(bookmark),
              icon: const Icon(Icons.play_arrow),
              tooltip: 'Jump to bookmark',
            ),
            IconButton(
              onPressed: () => _editBookmark(bookmark),
              icon: const Icon(Icons.edit),
              tooltip: 'Edit bookmark',
            ),
            IconButton(
              onPressed: () => _deleteBookmark(bookmark, bookmarkNotifier),
              icon: const Icon(Icons.delete),
              tooltip: 'Delete bookmark',
            ),
          ],
        ),
        onTap: () => _jumpToBookmark(bookmark),
      ),
    );
  }

  Widget _buildAddBookmarkSection(BookmarkNotifier bookmarkNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _editingBookmark != null ? 'Edit Bookmark' : 'Add Bookmark',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: 'Title',
            hintText: 'Enter bookmark title',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _noteController,
          decoration: const InputDecoration(
            labelText: 'Note (optional)',
            hintText: 'Add a note about this bookmark',
            border: OutlineInputBorder(),
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (_editingBookmark != null) ...[
              TextButton(onPressed: _cancelEdit, child: const Text('Cancel')),
              const SizedBox(width: 8),
            ],
            ElevatedButton(
              onPressed: _canAddBookmark()
                  ? () => _addOrUpdateBookmark(bookmarkNotifier)
                  : null,
              child: Text(_editingBookmark != null ? 'Update' : 'Add Bookmark'),
            ),
          ],
        ),
      ],
    );
  }

  bool _canAddBookmark() {
    return _titleController.text.trim().isNotEmpty;
  }

  void _addOrUpdateBookmark(BookmarkNotifier bookmarkNotifier) async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim().isEmpty
        ? null
        : _noteController.text.trim();

    if (_editingBookmark != null) {
      // Update existing bookmark
      await bookmarkNotifier.updateBookmark(_editingBookmark!.id, title, note);
      _cancelEdit();
    } else {
      // Add new bookmark at current position
      final playerService = ref.read(playerServiceProvider);
      final currentTime = playerService.overallCurrentTime();

      await bookmarkNotifier.addBookmark(currentTime.round(), title, note);

      _clearForm();
    }
  }

  void _editBookmark(Bookmark bookmark) {
    setState(() {
      _editingBookmark = bookmark;
      _titleController.text = bookmark.title;
      _noteController.text = bookmark.note ?? '';
    });
  }

  void _cancelEdit() {
    setState(() {
      _editingBookmark = null;
      _clearForm();
    });
  }

  void _clearForm() {
    _titleController.clear();
    _noteController.clear();
  }

  void _deleteBookmark(
    Bookmark bookmark,
    BookmarkNotifier bookmarkNotifier,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Bookmark'),
        content: Text('Are you sure you want to delete "${bookmark.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await bookmarkNotifier.deleteBookmark(bookmark.id);
    }
  }

  void _jumpToBookmark(Bookmark bookmark) async {
    final playerService = ref.read(playerServiceProvider);
    await playerService.seekTo(bookmark.time.toDouble());
    Navigator.of(context).pop();
  }

  String _formatTime(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    }
  }
}
