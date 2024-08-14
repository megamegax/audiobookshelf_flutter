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
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final _audioPlayer = ref.read(audioPlayerProvider);
    final libraryItemsRepository = ref.read(libraryItemsRepositoryProvider);
    final libraryRepository = ref.read(libraryRepositoryProvider.future);
    final libraryService = ref.read(libraryServiceProvider);
    final userModel = ref.read(userModelNotifierProvider);
    final ServerSettings? serverSettings =
        ref.read(serverSettingsNotifierProvider);
    final Future<Widget> future = libraryItemsRepository.when(
      data: (libraryItemsRepository) async {
        final libraryId =
            (await (await libraryRepository).getLibrary())[0].libraryId;

        final List<PersonalizedHome> personalizedHomeSections =
            await libraryService.fetchPersonalizedHome(userModel!, libraryId!);
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
        return Scaffold(
            backgroundColor: modifiedSurfaceColor,
            bottomSheet: _audioPlayer.audioSource != null
                ? Player(source: _audioPlayer.audioSource!)
                : null,
            appBar: AppBar(
              title: const Text('Home'),
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
                    ...homeSections
                        .map((homeSection) => buildSection(homeSection)),
                  ],
                ),
              ),
            ));
      },
      loading: () => Future.value(const CircularProgressIndicator()),
      error: (error, stackTrace) => Future.value(Text('Error: $error')),
    );
    return FutureBuilder<Widget>(
        future: future,
        builder: (context, snapshot) => snapshot.data ?? Container());
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
                    .map((libraryItem) => libraryItem is LibraryItemEntity
                        ? BookCard(libraryItem: libraryItem)
                        : SeriesCard(series: libraryItem as Series))
                    .toList())),
      ],
    );
  }
}
