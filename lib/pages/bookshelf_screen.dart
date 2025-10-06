import 'dart:developer' as dev;
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/pages/book_details.dart';
import 'package:audiobookshelf_flutter/layouts/responsive_layout.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/widgets/player.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/library_selector_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:audiobookshelf_flutter/widgets/library_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    final _audioPlayer = ref.read(audioPlayerProvider);

    dev.log('[BOOKSHELF_SCREEN] build() called');
    dev.log(
        '[BOOKSHELF_SCREEN] AudioPlayer has source: ${_audioPlayer.audioSource != null}');
    dev.log(
        '[BOOKSHELF_SCREEN] AudioPlayer state: ${_audioPlayer.playerState}');
    if (_audioPlayer.audioSource != null) {
      dev.log(
          '[BOOKSHELF_SCREEN] AudioSource type: ${_audioPlayer.audioSource.runtimeType}');
      dev.log(
          '[BOOKSHELF_SCREEN] AudioSource sequence length: ${_audioPlayer.audioSource!.sequence.length}');
    }
    final libraryItemsRepository = ref.read(libraryItemsRepositoryProvider);
    final libraryRepository = ref.read(libraryRepositoryProvider.future);
    final ServerSettings? serverSettings =
        ref.read(serverSettingsNotifierProvider);
    final Future<Widget> future = libraryItemsRepository.when(
      data: (libraryItemsRepository) async {
        final selectedLibrary = ref.read(selectedLibraryProvider);
        final libraryId = selectedLibrary?.id ??
            (await (await libraryRepository).getLibrary())[0].libraryId;
        final List<LibraryItemEntity> libraryItems =
            await libraryItemsRepository.getBooks(libraryId!);

        return ResponsiveLayout(
            title: 'Könyvespolc',
            selectedDrawerItem: SelectedItem.library,
            serverSettings: serverSettings,
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
              actions: const [
                CompactLibrarySelector(),
                SizedBox(width: 8),
              ],
            ),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: _audioPlayer.audioSource != null ? 100.0 : 0),
                  child: ListView(
                      children: libraryItems
                          .where((book) => book.media.metadata!.title!
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase()))
                          .map((libraryItem) {
                    final double progress = libraryItem.media.progress == null
                        ? 0
                        : libraryItem.media.progress!.progress!;

                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => BookDetails(
                                    item: libraryItem,
                                  )),
                        );
                      },
                      leading: Hero(
                          tag: 'bookImage${libraryItem.itemId}',
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.memory(
                                Uint8List.fromList(
                                    libraryItem.media.coverBytes ?? []),
                                fit: BoxFit.scaleDown),
                          )),
                      title: Hero(
                          tag: 'bookTitle${libraryItem.itemId}',
                          child: Text(libraryItem.media.metadata?.title ?? "-",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface))),
                      subtitle: LinearProgressIndicator(
                        value: progress,
                        color: progress == 1
                            ? Colors.green
                            : Theme.of(context).colorScheme.primary,
                      ),
                    );
                  }).toList()),
                ),
                // Floating player
                if (_audioPlayer.audioSource != null)
                  Builder(
                    builder: (context) {
                      dev.log(
                          '[BOOKSHELF_SCREEN] Rendering Player widget - audioSource exists');
                      return Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Player(source: _audioPlayer.audioSource!),
                      );
                    },
                  )
                else
                  Builder(
                    builder: (context) {
                      dev.log(
                          '[BOOKSHELF_SCREEN] Player widget NOT rendered - no audioSource');
                      return const SizedBox.shrink();
                    },
                  ),
              ],
            ));
      },
      loading: () => Future.value(const CircularProgressIndicator()),
      error: (error, stackTrace) => Future.value(Text('Error: $error')),
    );
    return FutureBuilder<Widget>(
        future: future,
        builder: (context, snapshot) => snapshot.data ?? Container());
  }
}
