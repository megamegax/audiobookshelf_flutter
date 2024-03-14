import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/drawer/book_drawer.dart';
import 'package:audiobookshelf_flutter/l10n-generated/app_localizations.dart';
import 'package:audiobookshelf_flutter/model/libraries/personalized_home.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/pages/book_card.dart';
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
                        (await libraryItemsRepository.getSerie(item.id));
                    return cachedSerie;
                  }
                }).toList()))));

        return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            drawer: BookDrawer(
              selectedItem: SelectedItem.home,
              serverSettings: serverSettings,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  ...homeSections
                      .map((homeSection) => buildSection(homeSection)),
                ],
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

  List<Widget> buildToContinueListening(List<LibraryItemEntity> libraryItems) {
    return libraryItems
        .where((book) =>
            book.media.progress != null &&
            book.media.progress!.progress! > 0.0 &&
            book.media.progress!.isFinished == false)
        .map((libraryItem) => BookCard(libraryItem: libraryItem))
        .toList();
  }

  List<Widget> buildSeriesToContinue(List<LibraryItemEntity> libraryItems) {
    final List<LibraryItemEntity> sortedLibraryItems = [];
    sortedLibraryItems.addAll(libraryItems);

    final filtered = sortedLibraryItems
        .where((book) => book.media.progress != null)
        .toList();
    filtered.sort((a, b) =>
        a.media.progress!.progress!.compareTo(b.media.progress!.progress!));
    return filtered
        .map((libraryItem) => BookCard(libraryItem: libraryItem))
        .toList();
  }

  List<Widget> buildToDiscover(List<LibraryItemEntity> libraryItems) {
    final List<LibraryItemEntity> sortedLibraryItems = [];
    sortedLibraryItems.addAll(libraryItems);

    final filtered = sortedLibraryItems
        .where((book) => book.media.progress == null)
        .toList();

    return filtered
        .map((libraryItem) => BookCard(libraryItem: libraryItem))
        .toList();
  }

  List<Widget> buildToListenAgain(List<LibraryItemEntity> libraryItems) {
    final List<LibraryItemEntity> sortedLibraryItems = [];
    sortedLibraryItems.addAll(libraryItems);

    final filtered = sortedLibraryItems
        .where((book) =>
            book.media.progress != null &&
            book.media.progress!.isFinished == true)
        .toList();

    return filtered
        .map((libraryItem) => BookCard(libraryItem: libraryItem))
        .toList();
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
                    .map((libraryItem) => libraryItem == null
                        ? Container()
                        : BookCard(libraryItem: libraryItem))
                    .toList())),
      ],
    );
  }
}
