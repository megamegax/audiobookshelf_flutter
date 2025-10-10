import 'dart:io';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/pages/book_details_wrapper.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/services/navigation_service.dart';
import 'package:audiobookshelf_flutter/layouts/responsive_layout.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/widgets/player.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/library_selector_provider.dart';
import 'package:audiobookshelf_flutter/provider/selected_book_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:audiobookshelf_flutter/widgets/library_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Search state provider for bookshelf
final bookshelfSearchProvider = StateProvider<String>((ref) => '');

class BookshelfScreen extends ConsumerStatefulWidget {
  const BookshelfScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return BookshelfScreenState();
  }
}

class BookshelfScreenState extends ConsumerState<BookshelfScreen> {
  @override
  Widget build(BuildContext context) {
    final _audioPlayer = ref.read(audioPlayerProvider);
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
                      child: Consumer(
                        builder: (context, ref, child) {
                          return TextField(
                            onChanged: (value) {
                              ref.read(bookshelfSearchProvider.notifier).state =
                                  value;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Search',
                              suffixIcon: Icon(Icons.search),
                            ),
                          );
                        },
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
                  child: Consumer(
                    builder: (context, ref, child) {
                      final searchQuery = ref.watch(bookshelfSearchProvider);
                      return ListView(
                          children: libraryItems
                              .where((book) => book.media.metadata!.title!
                                  .toLowerCase()
                                  .contains(searchQuery.toLowerCase()))
                              .map((libraryItem) {
                        final double progress =
                            libraryItem.media.progress == null
                                ? 0
                                : libraryItem.media.progress!.progress!;

                        return ListTile(
                          onTap: () async {
                            await _navigateToBookDetails(
                                context, ref, libraryItem);
                          },
                          leading: Hero(
                              tag: 'book-cover-${libraryItem.id}',
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: _buildListCoverImage(libraryItem),
                              )),
                          title: Hero(
                              tag: 'bookTitle${libraryItem.itemId}',
                              child: Text(
                                  libraryItem.media.metadata?.title ?? "-",
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
                      }).toList());
                    },
                  ),
                ),
                // Floating player
                Consumer(
                  builder: (context, ref, child) {
                    return _audioPlayer.audioSource != null
                        ? Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Player(source: _audioPlayer.audioSource!),
                          )
                        : const SizedBox.shrink();
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

  Widget _buildListCoverImage(LibraryItemEntity libraryItem) {
    final coverPath = libraryItem.media.coverPath;
    if (coverPath != null && coverPath.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: coverPath.startsWith('http')
            ? Image.network(
                coverPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholderIcon();
                },
              )
            : Image.file(
                File(coverPath),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholderIcon();
                },
              ),
      );
    }
    return _buildPlaceholderIcon();
  }

  Widget _buildPlaceholderIcon() {
    return Container(
      width: 50,
      height: 50,
      color: Colors.grey[300],
      child: const Icon(Icons.library_music, size: 24),
    );
  }

  Future<void> _navigateToBookDetails(BuildContext context, WidgetRef ref,
      LibraryItemEntity libraryItem) async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      // Get user model and library service
      final userModel = ref.read(userModelNotifierProvider);
      final libraryService = ref.read(libraryServiceProvider);

      if (userModel != null) {
        // Fetch detailed library item
        final detailedItem = await libraryService.fetchDetailedLibraryItem(
          userModel,
          libraryItem.itemId,
        );

        // Close loading dialog
        if (context.mounted) Navigator.of(context).pop();

        // Set the selected book in the provider
        ref.read(selectedBookProvider.notifier).selectBook(detailedItem);

        // Navigate to book details with hero animation
        if (context.mounted) {
          NavigationService.pushWithHero(
            context,
            BookDetailsWrapper(
              item: libraryItem,
              heroTag: 'book-cover-${libraryItem.id}',
            ),
            'book-cover-${libraryItem.id}',
          );
        }
      } else {
        // Close loading dialog
        if (context.mounted) Navigator.of(context).pop();
        // Handle no user case
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User not logged in')),
          );
        }
      }
    } catch (e) {
      // Close loading dialog
      if (context.mounted) Navigator.of(context).pop();
      // Handle error
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading book details: $e')),
        );
      }
    }
  }
}
