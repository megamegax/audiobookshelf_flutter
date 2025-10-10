import 'package:audiobookshelf_flutter/database/author_entity.dart';
import 'package:audiobookshelf_flutter/layouts/responsive_layout.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/library_selector_provider.dart';
import 'package:audiobookshelf_flutter/widgets/author_book_card.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/services/local_search_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorDetailsPage extends ConsumerStatefulWidget {
  final AuthorEntity author;

  const AuthorDetailsPage({
    super.key,
    required this.author,
  });

  @override
  ConsumerState<AuthorDetailsPage> createState() => _AuthorDetailsPageState();
}

class _AuthorDetailsPageState extends ConsumerState<AuthorDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  List<LibraryItemEntity> _books = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadAuthorBooks();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Could implement pagination here if needed
    }
  }

  Future<void> _loadAuthorBooks() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final userModel = ref.read(userModelProvider);
      if (userModel == null) {
        setState(() {
          _error = 'User not logged in';
          _isLoading = false;
        });
        return;
      }

      // Get the current library ID from the selected library provider
      final selectedLibrary = ref.read(selectedLibraryProvider);
      final libraryId = selectedLibrary?.id;

      if (libraryId == null) {
        setState(() {
          _error = 'No library selected';
          _isLoading = false;
        });
        return;
      }

      // Use local database search to find books by this author
      final libraryItemsRepository =
          await ref.read(libraryItemsRepositoryProvider.future);
      final localSearchService = ref.read(localSearchServiceProvider);
      final books = await localSearchService.searchBooksByAuthor(
          libraryItemsRepository, libraryId, widget.author.name);

      setState(() {
        _books = books;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load books: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final serverSettings = ref.read(serverSettingsProvider);

    return ResponsiveLayout(
      body: _buildBody(context),
      title: widget.author.name,
      selectedDrawerItem: SelectedItem.authors,
      serverSettings: serverSettings,
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading books...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error loading books',
              style: TextStyle(fontSize: 18, color: Colors.red[700]),
            ),
            const SizedBox(height: 8),
            Text(
              _error!,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadAuthorBooks,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_books.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu_book_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No books found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'This author has no books in your library',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        // Author info header
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Author image
                CircleAvatar(
                  radius: 40,
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainerHighest,
                  backgroundImage: widget.author.imageBytes?.isNotEmpty == true
                      ? () {
                          try {
                            return MemoryImage(
                                Uint8List.fromList(widget.author.imageBytes!));
                          } catch (e) {
                            if (kDebugMode) {
                              print(
                                  '[AUTHOR_DETAILS] Error creating MemoryImage: $e');
                            }
                            return null;
                          }
                        }()
                      : null,
                  child: widget.author.imageBytes?.isEmpty == true
                      ? Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          size: 40,
                        )
                      : null,
                ),
                const SizedBox(width: 16),
                // Author info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.author.name,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      if (widget.author.description?.isNotEmpty == true) ...[
                        const SizedBox(height: 8),
                        Text(
                          widget.author.description!,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.menu_book,
                            size: 16,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${_books.length} books',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Books grid
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200, // Maximum width per card
              childAspectRatio:
                  0.6, // Made taller to accommodate full-height covers
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final book = _books[index];
                return AuthorBookCard(
                  libraryItem: book,
                  heroTag: 'author-book-${book.id}-$index',
                );
              },
              childCount: _books.length,
            ),
          ),
        ),
        // Bottom padding
        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
      ],
    );
  }
}
