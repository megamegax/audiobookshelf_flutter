import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchContentWidget extends ConsumerStatefulWidget {
  final String searchQuery;
  final bool isSearching;
  final List<LibraryItemEntity> searchResults;

  const SearchContentWidget({
    super.key,
    required this.searchQuery,
    required this.isSearching,
    required this.searchResults,
  });

  @override
  ConsumerState<SearchContentWidget> createState() =>
      _SearchContentWidgetState();
}

class _SearchContentWidgetState extends ConsumerState<SearchContentWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isSearching) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Searching...'),
          ],
        ),
      );
    }

    if (widget.searchResults.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'No books found for "${widget.searchQuery}"',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Try searching for a different term',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Search Results (${widget.searchResults.length})',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 16),
        // Search results - vertical grid with fixed height cards
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, // Maximum width for each card
                childAspectRatio:
                    0.65, // Height/Width ratio to fit BookCard properly
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: widget.searchResults.length,
              itemBuilder: (context, index) {
                final book = widget.searchResults[index];
                return BookCard(
                  libraryItem: book,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
