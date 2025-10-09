import 'dart:async';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/widgets/library_selector.dart';
import 'package:audiobookshelf_flutter/widgets/sync_indicator.dart';
import 'package:audiobookshelf_flutter/layouts/responsive_layout.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/library_selector_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/widgets/home_content_widget.dart';
import 'package:audiobookshelf_flutter/widgets/search_content_widget.dart';
import 'package:audiobookshelf_flutter/services/local_search_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  String searchQuery = '';
  bool showPlayer = false;
  late AudioPlayer _audioPlayer;
  late TextEditingController _searchController;
  List<LibraryItemEntity> searchResults = [];
  bool isSearching = false;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    // Cancel previous timer
    _debounceTimer?.cancel();

    // Update search query immediately for UI feedback
    setState(() {
      searchQuery = query;
    });

    if (query.isEmpty) {
      setState(() {
        searchResults = [];
        isSearching = false;
      });
      return;
    }

    // Set searching state immediately
    setState(() {
      isSearching = true;
    });

    // Debounce the actual search
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      _performSearch(query);
    });
  }

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) {
      if (mounted) {
        setState(() {
          searchResults = [];
          isSearching = false;
        });
      }
      return;
    }

    try {
      final selectedLibrary = ref.read(selectedLibraryProvider);
      final libraryId = selectedLibrary?.id;

      if (libraryId == null) {
        if (kDebugMode) {
          print('[HOME_SCREEN] No library selected for search');
        }
        if (mounted) {
          setState(() {
            searchResults = [];
            isSearching = false;
          });
        }
        return;
      }

      final libraryItemsRepository =
          await ref.read(libraryItemsRepositoryProvider.future);
      final localSearchService = ref.read(localSearchServiceProvider);

      final results = await localSearchService.searchBooks(
        libraryItemsRepository,
        libraryId,
        query,
      );

      if (mounted) {
        setState(() {
          searchResults = results;
          isSearching = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('[HOME_SCREEN] Search error: $e');
      }
      if (mounted) {
        setState(() {
          searchResults = [];
          isSearching = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('[HOME_SCREEN] HomeScreen build kezdődik...');
    }

    _audioPlayer = ref.watch(audioPlayerProvider);

    // Update player visibility
    if (_audioPlayer.audioSource != null) {
      setState(() {
        showPlayer = true;
      });
    } else {
      showPlayer = false;
    }

    // Only watch essential providers for the main layout
    final ServerSettings? serverSettings =
        ref.watch(serverSettingsNotifierProvider);

    return ResponsiveLayout(
      title: 'Audiobookshelf - Flutter',
      selectedDrawerItem: SelectedItem.home,
      serverSettings: serverSettings,
      appBar: AppBar(
        title: searchQuery.isEmpty
            ? const Text('Audiobookshelf - Flutter')
            : Text('Search: $searchQuery'),
        actions: [
          if (searchQuery.isEmpty) ...[
            const CompactLibrarySelector(),
            const SyncIndicator(),
            const SizedBox(width: 8),
          ] else ...[
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                setState(() {
                  searchQuery = '';
                  searchResults = [];
                  isSearching = false;
                });
              },
            ),
            const SizedBox(width: 8),
          ],
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search books, authors, narrators...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
              ),
              onChanged: _onSearchChanged,
              controller: _searchController,
            ),
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).brightness == Brightness.dark
            ? Color.alphaBlend(
                Colors.white.withOpacity(0.1),
                Theme.of(context).colorScheme.surface,
              )
            : Color.alphaBlend(
                Colors.black.withOpacity(0.05),
                Theme.of(context).colorScheme.surface,
              ),
        child: Padding(
          padding: EdgeInsets.only(
              bottom: _audioPlayer.audioSource != null ? 100.0 : 0),
          child: Column(
            children: [
              // Search results or home content
              Expanded(
                child: searchQuery.isEmpty
                    ? const HomeContentWidget()
                    : SearchContentWidget(
                        searchQuery: searchQuery,
                        isSearching: isSearching,
                        searchResults: searchResults,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
