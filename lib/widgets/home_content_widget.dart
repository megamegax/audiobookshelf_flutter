import 'package:audiobookshelf_flutter/database/author_entity.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/database/series.dart';
import 'package:audiobookshelf_flutter/model/libraries/personalized_home.dart';
import 'package:audiobookshelf_flutter/pages/author_details_page.dart';
import 'package:audiobookshelf_flutter/repositories/authors_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:audiobookshelf_flutter/widgets/author_card.dart';
import 'package:audiobookshelf_flutter/widgets/background_loading_indicator.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_book_card.dart';
import 'package:audiobookshelf_flutter/widgets/series_card.dart';
import 'package:audiobookshelf_flutter/provider/library_selector_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeContentWidget extends ConsumerWidget {
  const HomeContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print('[HOME_CONTENT] Building home content...');
    }

    final libraryItemsRepository = ref.watch(libraryItemsRepositoryProvider);
    final libraryRepositoryAsync = ref.watch(libraryRepositoryProvider);
    final selectedLibrary = ref.watch(selectedLibraryProvider);

    return libraryItemsRepository.when(
      data: (libraryItemsRepository) {
        return libraryRepositoryAsync.when(
          data: (libraryRepository) {
            return FutureBuilder(
              future: _loadData(libraryRepository, libraryItemsRepository,
                  selectedLibrary, ref),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final data = snapshot.data!;
                final homeSections =
                    data['sections'] as List<PersonalizedHomeEntity>;

                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const BackgroundLoadingIndicator(),
                      ...homeSections.map((homeSection) =>
                          _buildSection(context, ref, homeSection)),
                      const SizedBox(height: 20), // Extra bottom padding
                    ],
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }

  Future<Map<String, dynamic>> _loadData(
    LibraryRepository libraryRepository,
    LibraryItemsRepository libraryItemsRepository,
    dynamic selectedLibrary,
    WidgetRef ref,
  ) async {
    final libraries = await libraryRepository.getLibrary();
    final libraryId = selectedLibrary?.id ?? libraries[0].libraryId;

    if (kDebugMode) {
      print('[HOME_CONTENT] Processing library: $libraryId');
    }

    // Get cached books
    final cachedBooks =
        await libraryItemsRepository.getBooksByLibraryId(libraryId);

    // Get series
    final series = await libraryItemsRepository.getSeries(libraryId);

    // Get authors
    final authorsRepository = await ref.read(authorsRepositoryProvider.future);
    final authors = await authorsRepository.getAllAuthors();

    // Build home sections
    final homeSections =
        await _buildHomeSections(ref, cachedBooks, series, authors, libraryId);

    return {
      'sections': homeSections,
    };
  }

  Future<List<PersonalizedHomeEntity>> _buildHomeSections(
    WidgetRef ref,
    List<LibraryItemEntity> cachedBooks,
    List<Series> series,
    List<AuthorEntity> authors,
    String libraryId,
  ) async {
    final homeSections = <PersonalizedHomeEntity>[];

    // 1. Continue Listening
    final continueListeningBooks = cachedBooks
        .where((book) =>
            book.media.progress != null &&
            (book.media.progress!.progress ?? 0) > 0 &&
            (book.media.progress!.progress ?? 0) < 1)
        .toList()
      ..sort((a, b) {
        final aLastAccess = a.media.progress?.lastAccessedAt ?? 0;
        final bLastAccess = b.media.progress?.lastAccessedAt ?? 0;
        if (aLastAccess == bLastAccess ||
            (aLastAccess == 0 && bLastAccess == 0)) {
          final aLastUpdate = a.media.progress?.lastUpdate ?? 0;
          final bLastUpdate = b.media.progress?.lastUpdate ?? 0;
          return bLastUpdate.compareTo(aLastUpdate);
        }
        return bLastAccess.compareTo(aLastAccess);
      });

    if (continueListeningBooks.isNotEmpty) {
      homeSections.add(PersonalizedHomeEntity(
        id: SectionType.continueListening,
        type: "book",
        entities: continueListeningBooks.take(10).toList(),
      ));
    }

    // 2. Continue Series
    final continueSeries = <Series>[];
    for (final seriesItem in series) {
      final hasProgress = seriesItem.books.any((book) {
        final progress = book.media.progress?.progress ?? 0.0;
        return progress > 0 && progress < 1;
      });
      if (hasProgress) {
        continueSeries.add(seriesItem);
      }
    }

    if (continueSeries.isNotEmpty) {
      homeSections.add(PersonalizedHomeEntity(
        id: SectionType.continueSeries,
        type: "series",
        entities: continueSeries.take(10).toList(),
      ));
    }

    // 3. Recently Added
    final sortedBooks = cachedBooks.toList()
      ..sort((a, b) => (b.addedAt).compareTo(a.addedAt));

    homeSections.add(PersonalizedHomeEntity(
      id: SectionType.recentlyAdded,
      type: "book",
      entities: sortedBooks.take(20).toList(),
    ));

    // 4. Recent Series
    if (series.isNotEmpty) {
      homeSections.add(PersonalizedHomeEntity(
        id: SectionType.recentSeries,
        type: "series",
        entities: series.take(10).toList(),
      ));
    }

    // 5. Discover
    if (sortedBooks.length > 20) {
      homeSections.add(PersonalizedHomeEntity(
        id: SectionType.discover,
        type: "book",
        entities: sortedBooks.skip(20).take(30).toList(),
      ));
    }

    // 6. Listen Again
    final finishedBooks = cachedBooks
        .where((book) =>
            book.media.progress != null &&
            (book.media.progress!.progress ?? 0) >= 1)
        .toList()
      ..sort((a, b) => (b.media.progress?.lastUpdate ?? 0)
          .compareTo(a.media.progress?.lastUpdate ?? 0));

    if (finishedBooks.isNotEmpty) {
      homeSections.add(PersonalizedHomeEntity(
        id: SectionType.listenAgain,
        type: "book",
        entities: finishedBooks.take(20).toList(),
      ));
    }

    // 7. Newest Authors
    if (authors.isNotEmpty) {
      homeSections.add(PersonalizedHomeEntity(
        id: SectionType.newestAuthors,
        type: "author",
        entities: authors.take(20).toList(),
      ));
    }

    return homeSections;
  }

  Widget _buildSection(
      BuildContext context, WidgetRef ref, PersonalizedHomeEntity homeSection) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            _getSectionDisplayName(homeSection.id),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: homeSection.id == SectionType.newestAuthors ? 120 : 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: homeSection.entities.length,
            itemBuilder: (context, index) {
              final entity = homeSection.entities[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child:
                    _buildEntityCard(context, ref, entity, homeSection, index),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  String _getSectionDisplayName(SectionType sectionType) {
    switch (sectionType) {
      case SectionType.continueListening:
        return 'Continue Listening';
      case SectionType.continueSeries:
        return 'Continue Series';
      case SectionType.recentlyAdded:
        return 'Recently Added';
      case SectionType.recentSeries:
        return 'Recent Series';
      case SectionType.discover:
        return 'Discover';
      case SectionType.listenAgain:
        return 'Listen Again';
      case SectionType.newestAuthors:
        return 'Newest Authors';
      case SectionType.newestEpisodes:
        return 'Newest Episodes';
      case SectionType.continuePodcast:
        return 'Continue Podcast';
      case SectionType.recentPodcasts:
        return 'Recent Podcasts';
    }
  }

  Widget _buildEntityCard(
    BuildContext context,
    WidgetRef ref,
    dynamic entity,
    PersonalizedHomeEntity homeSection,
    int index,
  ) {
    if (entity is LibraryItemEntity) {
      return MorphingBookCard(
        libraryItem: entity,
        heroTag: 'book-cover-${entity.id}-${homeSection.id.name}-$index',
      );
    } else if (entity is Series) {
      return SeriesCard(
        series: entity,
      );
    } else if (entity is AuthorEntity) {
      return AuthorCard(
        author: entity,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AuthorDetailsPage(author: entity),
            ),
          );
        },
      );
    }
    return const SizedBox.shrink();
  }
}
