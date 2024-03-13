import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/drawer/book_drawer.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/pages/book_card.dart';
import 'package:audiobookshelf_flutter/pages/book_details.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
    final ServerSettings? serverSettings =
        ref.read(serverSettingsNotifierProvider);
    final Future<Widget> future = libraryItemsRepository.when(
      data: (libraryItemsRepository) async {
        final libraryId =
            (await (await libraryRepository).getLibrary())[0].libraryId;
        final List<LibraryItemEntity> libraryItems =
            await libraryItemsRepository.getBooks(libraryId!);

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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Hallgatás folytatása",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                        Row(children: buildToContinueListening(libraryItems)),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Sorozat folytatása",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:
                          Row(children: buildSeriesToContinue(libraryItems))),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Nemrég hozzáadott sorozatok",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: buildRecentSeries(libraryItems))),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Felfedezés",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: buildToDiscover(libraryItems))),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Hallgasd újra",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: buildToListenAgain(libraryItems))),
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

//todo recently added series not recently listened
  List<Widget> buildRecentSeries(List<LibraryItemEntity> libraryItems) {
    final List<LibraryItemEntity> sortedLibraryItems = [];
    sortedLibraryItems.addAll(
        libraryItems.where((book) => book.media.progress != null).toList());
    sortedLibraryItems.sort((a, b) =>
        a.media.progress!.lastUpdate!.compareTo(b.media.progress!.lastUpdate!));

    final filtered = sortedLibraryItems.last;
    return [Text(filtered.media.metadata!.seriesName!)];
  }
}
