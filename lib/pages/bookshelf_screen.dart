import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/drawer/book_drawer.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/pages/book_details.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookshelfScreen extends ConsumerStatefulWidget {
  const BookshelfScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return BookshelfScreenState();
  }
}

class BookshelfScreenState extends ConsumerState<BookshelfScreen> {
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
              title: Row(
                children: [
                  const Text('Könyvespolc'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            drawer: BookDrawer(
              selectedItem: SelectedItem.library,
              serverSettings: serverSettings,
            ),
            body: ListView(
                children: libraryItems
                    .where((book) => book.media.metadata!.title!
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase()))
                    .map((libraryItem) => ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => BookDetails(
                                        item: libraryItem,
                                      )),
                            );
                          },
                          leading: Hero(
                              tag: 'bookImage${libraryItem.itemId ?? ""}',
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.memory(
                                    Uint8List.fromList(
                                        libraryItem.media.coverBytes ?? []),
                                    fit: BoxFit.scaleDown),
                              )),
                          title: Hero(
                              tag: 'bookTitle${libraryItem.itemId ?? ""}',
                              child: Text(
                                  libraryItem.media.metadata?.title ?? "-",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface))),
                          subtitle: Text(
                              "Progress: ${((libraryItem.media.progress?.currentTime ?? 0.0) / (libraryItem.media.duration ?? 0.0) * 100).toStringAsPrecision(3)}%"),
                        ))
                    .toList()));
      },
      loading: () => Future.value(const CircularProgressIndicator()),
      error: (error, stackTrace) => Future.value(Text('Error: $error')),
    );
    return FutureBuilder<Widget>(
        future: future,
        builder: (context, snapshot) => snapshot.data ?? Container());
  }
}
