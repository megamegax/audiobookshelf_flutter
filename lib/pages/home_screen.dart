import 'dart:async';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/database/series.dart';
import 'package:audiobookshelf_flutter/drawer/book_drawer.dart';
import 'package:audiobookshelf_flutter/l10n-generated/app_localizations.dart';
import 'package:audiobookshelf_flutter/model/libraries/personalized_home.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/widgets/book_card.dart';
import 'package:audiobookshelf_flutter/widgets/player.dart';
import 'package:audiobookshelf_flutter/widgets/series_card.dart';
import 'package:audiobookshelf_flutter/widgets/library_selector.dart';
import 'package:audiobookshelf_flutter/widgets/sync_indicator.dart';
import 'package:audiobookshelf_flutter/widgets/background_loading_indicator.dart';
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

    if (_audioPlayer.audioSource != null) {
      setState(() {
        showPlayer = true;
      });
    } else {
      showPlayer = false;
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
    final Future<Widget> future = libraryItemsRepository.when(
      data: (libraryItemsRepository) async {
        if (kDebugMode) {
          print('[HOME_SCREEN] LibraryItemsRepository betöltve');
        }

        final selectedLibrary = ref.read(selectedLibraryProvider);
        final libraries = await (await libraryRepository).getLibrary();
        final libraryId = selectedLibrary?.id ?? libraries[0].libraryId;

        if (kDebugMode) {
          print('[HOME_SCREEN] Selected library: ${selectedLibrary?.name}');
          print('[HOME_SCREEN] Library ID: $libraryId');
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
                    final cachedBook =
                        (await libraryItemsRepository.getBook(item.id));
                    return cachedBook;
                  } else {
                    final cachedSerie =
                        (await libraryItemsRepository.getSeriesItem(item.id));
                    return cachedSerie;
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

        return Scaffold(
            backgroundColor: modifiedSurfaceColor,
            bottomSheet:
                showPlayer ? Player(source: _audioPlayer.audioSource!) : null,
            appBar: AppBar(
              title: const Text('Audiobookshelf - Flutter'),
              actions: const [
                CompactLibrarySelector(),
                SyncIndicator(),
                SizedBox(width: 8),
              ],
            ),
            drawer: BookDrawer(
              selectedItem: SelectedItem.home,
              serverSettings: serverSettings,
            ),
            body: Padding(
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
            ));
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
            },
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: homeSection.entities
                    .where((libraryItem) => libraryItem != null)
                    .map((libraryItem) {
              if (libraryItem is LibraryItemEntity) {
                return BookCard(libraryItem: libraryItem);
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
