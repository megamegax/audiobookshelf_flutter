import 'package:audiobookshelf_flutter/services/advanced_search_service.dart';
import 'package:audiobookshelf_flutter/provider/advanced_search_provider.dart';
import 'package:audiobookshelf_flutter/drawer/book_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdvancedSearchPage extends ConsumerStatefulWidget {
  const AdvancedSearchPage({super.key});

  @override
  ConsumerState<AdvancedSearchPage> createState() => _AdvancedSearchPageState();
}

class _AdvancedSearchPageState extends ConsumerState<AdvancedSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Load more results when near bottom
      ref.read(advancedSearchStateProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(advancedSearchStateProvider);
    final searchNotifier = ref.read(advancedSearchStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Search'),
        actions: [
          IconButton(
            icon: Icon(
                _showFilters ? Icons.filter_list : Icons.filter_list_outlined),
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
          ),
        ],
      ),
      drawer: const BookDrawer(
          selectedItem: SelectedItem.library, serverSettings: null),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search audiobooks...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          searchNotifier.clearSearch();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                if (value.length >= 2) {
                  searchNotifier.search(value);
                } else if (value.isEmpty) {
                  searchNotifier.clearSearch();
                }
              },
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  searchNotifier.search(value);
                }
              },
            ),
          ),

          // Filters
          if (_showFilters) _buildFilters(),

          // Search results
          Expanded(
            child: _buildSearchResults(searchState),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    final searchState = ref.watch(advancedSearchStateProvider);
    final searchNotifier = ref.read(advancedSearchStateProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filters',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilterChip(
                label: const Text('Audiobooks'),
                selected: searchState.filters.mediaTypes.contains('audiobook'),
                onSelected: (selected) {
                  searchNotifier.toggleMediaType('audiobook', selected);
                },
              ),
              FilterChip(
                label: const Text('Podcasts'),
                selected: searchState.filters.mediaTypes.contains('podcast'),
                onSelected: (selected) {
                  searchNotifier.toggleMediaType('podcast', selected);
                },
              ),
              FilterChip(
                label: const Text('E-books'),
                selected: searchState.filters.mediaTypes.contains('ebook'),
                onSelected: (selected) {
                  searchNotifier.toggleMediaType('ebook', selected);
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Min Year',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    final year = int.tryParse(value);
                    searchNotifier.setYearRange(
                        year, searchState.filters.yearMax);
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Max Year',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    final year = int.tryParse(value);
                    searchNotifier.setYearRange(
                        searchState.filters.yearMin, year);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(AdvancedSearchState searchState) {
    if (searchState.isLoading && searchState.results.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (searchState.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Search Error: ${searchState.error}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  ref.read(advancedSearchStateProvider.notifier).retry(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (searchState.results.isEmpty && !searchState.isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('No results found'),
            SizedBox(height: 8),
            Text('Try adjusting your search terms or filters'),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: searchState.results.length + (searchState.isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == searchState.results.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          );
        }

        final result = searchState.results[index];
        return _buildSearchResultCard(result);
      },
    );
  }

  Widget _buildSearchResultCard(SearchResult result) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(
            _getMediaTypeIcon(result.mediaType),
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(result.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (result.author != null) Text('Author: ${result.author}'),
            if (result.narrator != null) Text('Narrator: ${result.narrator}'),
            if (result.series != null) Text('Series: ${result.series}'),
            if (result.year != null) Text('Year: ${result.year}'),
            if (result.rating != null)
              Text('Rating: ${result.rating!.toStringAsFixed(1)}'),
            if (result.duration != null)
              Text('Duration: ${_formatDuration(result.duration!)}'),
            if (result.progress != null)
              LinearProgressIndicator(
                value: result.progress! / 100,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
          ],
        ),
        isThreeLine: true,
        onTap: () {
          // Navigate to book details
          // TODO: Implement navigation to book details
        },
      ),
    );
  }

  IconData _getMediaTypeIcon(String? mediaType) {
    switch (mediaType?.toLowerCase()) {
      case 'audiobook':
        return Icons.headphones;
      case 'podcast':
        return Icons.radio;
      case 'ebook':
        return Icons.menu_book;
      default:
        return Icons.library_books;
    }
  }

  String _formatDuration(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
