import 'dart:async';
import 'dart:developer' as dev;

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/database/series.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:audiobookshelf_flutter/l10n-generated/app_localizations.dart';
import 'package:audiobookshelf_flutter/model/libraries/personalized_home.dart';

import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_book_card.dart';
import 'package:audiobookshelf_flutter/widgets/series_card.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/widgets/library_selector.dart';
import 'package:audiobookshelf_flutter/widgets/sync_indicator.dart';
import 'package:audiobookshelf_flutter/widgets/background_loading_indicator.dart';
import 'package:audiobookshelf_flutter/widgets/player.dart';
import 'package:audiobookshelf_flutter/layouts/responsive_layout.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/library_selector_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('[HOME_SCREEN] HomeScreen build kezdődik...');
    }

    _audioPlayer = ref.watch(audioPlayerProvider);

    // Comprehensive audioPlayer logging
    dev.log('[HOME_SCREEN] AudioPlayer state check:');
    dev.log(
        '[HOME_SCREEN] - Has audioSource: ${_audioPlayer.audioSource != null}');
    dev.log('[HOME_SCREEN] - Player state: ${_audioPlayer.playerState}');
    dev.log('[HOME_SCREEN] - Playing: ${_audioPlayer.playing}');
    dev.log('[HOME_SCREEN] - Current position: ${_audioPlayer.position}');
    if (_audioPlayer.audioSource != null) {
      dev.log(
          '[HOME_SCREEN] - AudioSource type: ${_audioPlayer.audioSource.runtimeType}');
      dev.log(
          '[HOME_SCREEN] - Sequence length: ${_audioPlayer.audioSource!.sequence.length}');
      if (_audioPlayer.audioSource!.sequence.isNotEmpty) {
        final tag = _audioPlayer.audioSource!.sequence[0].tag;
        dev.log('[HOME_SCREEN] - Current media tag: $tag');
        if (tag is MediaItem) {
          dev.log(
              '[HOME_SCREEN] - Current media: ${tag.title} by ${tag.artist}');
        }
      }
    }

    if (_audioPlayer.audioSource != null) {
      setState(() {
        showPlayer = true;
      });
      dev.log('[HOME_SCREEN] Setting showPlayer = true');
    } else {
      showPlayer = false;
      dev.log('[HOME_SCREEN] Setting showPlayer = false');
    }

    final libraryItemsRepository = ref.read(libraryItemsRepositoryProvider);
    final libraryRepository = ref.read(libraryRepositoryProvider.future);
    final libraryService = ref.read(libraryServiceProvider);
    final userModel = ref.read(userModelNotifierProvider);
    final ServerSettings? serverSettings =
        ref.read(serverSettingsNotifierProvider);

    if (kDebugMode) {
      print('[HOME_SCREEN] UserModel: ${userModel?.username}');
      print('[HOME_SCREEN] ServerSettings: ${serverSettings != null}');
    }
    // Watch the selected library to make the widget reactive
    final selectedLibrary = ref.watch(selectedLibraryProvider);

    final Future<Widget> future = libraryItemsRepository.when(
      data: (libraryItemsRepository) async {
        if (kDebugMode) {
          print('[HOME_SCREEN] LibraryItemsRepository betöltve');
        }

        final libraries = await (await libraryRepository).getLibrary();
        final libraryId = selectedLibrary?.id ?? libraries[0].libraryId;

        if (kDebugMode) {
          print('[HOME_SCREEN] Selected library: ${selectedLibrary?.name}');
          print('[HOME_SCREEN] Library ID: $libraryId');
          final availableLibrariesAsync = ref.read(availableLibrariesProvider);
          availableLibrariesAsync.when(
            data: (availableLibraries) => print(
                '[HOME_SCREEN] Available libraries: ${availableLibraries.map((lib) => '${lib.name} (${lib.id})').join(', ')}'),
            loading: () =>
                print('[HOME_SCREEN] Available libraries: Loading...'),
            error: (error, stack) =>
                print('[HOME_SCREEN] Available libraries: Error - $error'),
          );
        }

        if (userModel == null) {
          if (kDebugMode) {
            print('[HOME_SCREEN] UserModel null!');
          }
          return const Center(child: Text('User not found'));
        }

        if (kDebugMode) {
          print('[HOME_SCREEN] Personalized home betöltése...');
        }

        final List<PersonalizedHome> personalizedHomeSections =
            await libraryService.fetchPersonalizedHome(userModel, libraryId!);

        if (kDebugMode) {
          print(
              '[HOME_SCREEN] ${personalizedHomeSections.length} personalized home section betöltve');
        }
        if (kDebugMode) {
          print('[HOME_SCREEN] Home sections feldolgozása...');
        }

        final homeSections = await Future.wait(personalizedHomeSections.map(
            (section) async => PersonalizedHomeEntity(
                id: section.id,
                type: section.type,
                entities: await Future.wait(
                    section.entities.map((PersonalizedEntity item) async {
                  if (section.type == "book") {
                    // Use generic method that works for all media types (books, podcasts, children's books)
                    final cachedItem = (await libraryItemsRepository
                        .getBookByLibrary(item.id, libraryId));
                    // If not cached, return null (will be loaded by background service)
                    // This prevents empty sections from showing while background loading is in progress
                    return cachedItem;
                  } else {
                    // For series, we need to check if any book in this series belongs to the current library
                    final cachedSerie =
                        (await libraryItemsRepository.getSeriesItem(item.id));
                    if (cachedSerie != null) {
                      // Check if any book in this series belongs to the current library
                      final hasBookInLibrary = cachedSerie.books
                          .any((book) => book.libraryId == libraryId);
                      return hasBookInLibrary ? cachedSerie : null;
                    }
                    // If not cached, return null (will be loaded by background service)
                    // This prevents empty sections from showing while background loading is in progress
                    return null;
                  }
                }).toList()))));

        if (kDebugMode) {
          print(
              '[HOME_SCREEN] ${homeSections.length} home section feldolgozva');
        }

        bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
        Color modifiedSurfaceColor;
        if (isDarkMode) {
          // Sötét mód - világosít
          modifiedSurfaceColor = Color.alphaBlend(
            Colors.white.withOpacity(0.1), // Világosítás mértéke
            Theme.of(context).colorScheme.surface,
          );
        } else {
          // Világos mód - sötétít
          modifiedSurfaceColor = Color.alphaBlend(
            Colors.black.withOpacity(0.1), // Sötétítés mértéke
            Theme.of(context).colorScheme.surface,
          );
        }
        if (kDebugMode) {
          print('[HOME_SCREEN] Scaffold létrehozása...');
        }

        return Stack(
          children: [
            ResponsiveLayout(
                title: 'Audiobookshelf - Flutter',
                selectedDrawerItem: SelectedItem.home,
                serverSettings: serverSettings,
                appBar: AppBar(
                  title: const Text('Audiobookshelf - Flutter'),
                  actions: const [
                    CompactLibrarySelector(),
                    SyncIndicator(),
                    SizedBox(width: 8),
                  ],
                ),
                body: Container(
                  color: modifiedSurfaceColor,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: _audioPlayer.audioSource != null ? 100.0 : 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          // Background loading indicator
                          const BackgroundLoadingIndicator(),
                          ...homeSections
                              .map((homeSection) => buildSection(homeSection)),
                        ],
                      ),
                    ),
                  ),
                )),
            // Floating Player Widget
            if (_audioPlayer.audioSource != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Builder(
                  builder: (context) {
                    dev.log(
                        '[HOME_SCREEN] Rendering Player widget - audioSource exists');
                    return Player(source: _audioPlayer.audioSource!);
                  },
                ),
              )
            else
              Builder(
                builder: (context) {
                  dev.log(
                      '[HOME_SCREEN] Player widget NOT rendered - no audioSource');
                  return const SizedBox.shrink();
                },
              ),
          ],
        );
      },
      loading: () {
        if (kDebugMode) {
          print('[HOME_SCREEN] LibraryItemsRepository loading...');
        }
        return Future.value(const Center(child: CircularProgressIndicator()));
      },
      error: (error, stackTrace) {
        if (kDebugMode) {
          print('[HOME_SCREEN] LibraryItemsRepository error: $error');
        }
        return Future.value(Center(child: Text('Error: $error')));
      },
    );

    if (kDebugMode) {
      print('[HOME_SCREEN] FutureBuilder létrehozása...');
    }

    return FutureBuilder<Widget>(
        future: future,
        builder: (context, snapshot) {
          if (kDebugMode) {
            print(
                '[HOME_SCREEN] FutureBuilder snapshot state: ${snapshot.connectionState}');
            if (snapshot.hasError) {
              print('[HOME_SCREEN] FutureBuilder error: ${snapshot.error}');
            }
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(title: const Text('Audiobookshelf - Flutter')),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error: ${snapshot.error}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          return snapshot.data ??
              Scaffold(
                appBar: AppBar(title: const Text('Audiobookshelf - Flutter')),
                body: const Center(child: Text('No data')),
              );
        });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildSection(PersonalizedHomeEntity homeSection) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            switch (homeSection.id) {
              SectionType.continueListening =>
                AppLocalizations.of(context)!.headerContinueListening,
              SectionType.continueSeries =>
                AppLocalizations.of(context)!.headerContinueSeries,
              SectionType.recentSeries =>
                AppLocalizations.of(context)!.headerRecentSeries,
              SectionType.recentlyAdded =>
                AppLocalizations.of(context)!.headerRecentlyAdded,
              SectionType.newestAuthors =>
                AppLocalizations.of(context)!.headerNewestAuthors,
              SectionType.discover =>
                AppLocalizations.of(context)!.headerDiscover,
              SectionType.listenAgain =>
                AppLocalizations.of(context)!.headerListenAgain,
              SectionType.newestEpisodes =>
                AppLocalizations.of(context)!.headerNewestEpisodes,
              SectionType.continuePodcast =>
                AppLocalizations.of(context)!.headerContinuePodcast,
              SectionType.recentPodcasts =>
                AppLocalizations.of(context)!.headerRecentPodcasts,
            },
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: homeSection.entities
                    .where((libraryItem) => libraryItem != null)
                    .toList()
                    .cast<dynamic>()
                    .asMap()
                    .entries
                    .map((entry) {
              final index = entry.key;
              final libraryItem = entry.value;
              if (libraryItem is LibraryItemEntity) {
                return MorphingBookCard(
                  libraryItem: libraryItem,
                  heroTag:
                      'book-cover-${libraryItem.id}-${homeSection.id.name}-$index',
                );
              } else if (libraryItem is Series) {
                return SeriesCard(series: libraryItem);
              } else {
                if (kDebugMode) {
                  print(
                      '[HOME_SCREEN] Unknown entity type: ${libraryItem.runtimeType}');
                }
                return const SizedBox.shrink();
              }
            }).toList())),
      ],
    );
  }
}
