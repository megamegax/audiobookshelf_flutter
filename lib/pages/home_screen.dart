import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_notifier.dart';
import 'package:audiobookshelf_flutter/widgets/library_selector.dart';
import 'package:audiobookshelf_flutter/widgets/sync_indicator.dart';
import 'package:audiobookshelf_flutter/layouts/responsive_layout.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/widgets/home_content_widget.dart';
import 'package:audiobookshelf_flutter/widgets/search_content_widget.dart';
import 'package:audiobookshelf_flutter/provider/search_notifier.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print('[HOME_SCREEN] HomeScreen build kezdődik...');
    }

    // Watch the search state
    final searchState = ref.watch(searchProvider);
    final searchNotifier = ref.read(searchProvider.notifier);

    // Watch the audio player
    final audioPlayer = ref.watch(audioPlayerProvider);

    // Only watch essential providers for the main layout
    final ServerSettings? serverSettings = ref.watch(serverSettingsProvider);

    return ResponsiveLayout(
      title: 'Audiobookshelf - Flutter',
      selectedDrawerItem: SelectedItem.home,
      serverSettings: serverSettings,
      appBar: AppBar(
        title: searchState.query.isEmpty
            ? const Text('Audiobookshelf - Flutter')
            : Text('Search: ${searchState.query}'),
        actions: [
          if (searchState.query.isEmpty) ...[
            const CompactLibrarySelector(),
            const SyncIndicator(),
            const SizedBox(width: 8),
          ] else ...[
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                searchNotifier.clearSearch();
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
              onChanged: (query) => searchNotifier.updateQuery(query),
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
            bottom: audioPlayer.audioSource != null ? 100.0 : 0,
          ),
          child: Column(
            children: [
              // Search results or home content
              Expanded(
                child: searchState.query.isEmpty
                    ? const HomeContentWidget()
                    : SearchContentWidget(
                        searchQuery: searchState.query,
                        isSearching: searchState.isSearching,
                        searchResults: searchState.results,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
