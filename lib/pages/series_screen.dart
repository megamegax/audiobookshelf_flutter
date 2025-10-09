import 'package:audiobookshelf_flutter/model/series.dart';
import 'package:audiobookshelf_flutter/layouts/responsive_layout.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/services/series_cover_service.dart';
import 'package:audiobookshelf_flutter/services/navigation_service.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for real series data
final seriesProvider = FutureProvider<List<Series>>((ref) async {
  final libraryItemsRepository =
      await ref.read(libraryItemsRepositoryProvider.future);
  // For now, let's get series from all libraries by getting all books and extracting unique series
  // This is a simplified approach - in a real app you might want to store series separately
  final libraryRepository = await ref.read(libraryRepositoryProvider.future);
  final libraries = await libraryRepository.getLibrary();
  final allBooks = <LibraryItemEntity>[];

  // Get books from all libraries
  for (final library in libraries) {
    if (library.libraryId != null) {
      final books =
          await libraryItemsRepository.getBooksByLibraryId(library.libraryId!);
      allBooks.addAll(books);
    }
  }
  final seriesMap = <String, Series>{};

  for (final book in allBooks) {
    final seriesName = book.media.metadata?.seriesName;
    if (seriesName != null && seriesName.isNotEmpty) {
      if (!seriesMap.containsKey(seriesName)) {
        seriesMap[seriesName] = Series(
          id: seriesName.toLowerCase().replaceAll(' ', '_'),
          name: seriesName,
          description: null,
          numBooks: 1,
        );
      } else {
        seriesMap[seriesName] = Series(
          id: seriesMap[seriesName]!.id,
          name: seriesName,
          description: seriesMap[seriesName]!.description,
          numBooks: seriesMap[seriesName]!.numBooks + 1,
        );
      }
    }
  }

  return seriesMap.values.toList();
});

class SeriesScreen extends ConsumerWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverSettings = ref.read(serverSettingsNotifierProvider);

    return ResponsiveLayout(
      body: _buildBody(context, ref),
      title: 'Series',
      selectedDrawerItem: SelectedItem.series,
      serverSettings: serverSettings,
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    final seriesAsync = ref.watch(seriesProvider);

    return seriesAsync.when(
      data: (series) {
        if (series.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.library_books_outlined,
                    size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No series found',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  'Series will appear here once books are loaded',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final seriesItem = series[index];
                    return _buildSeriesCard(context, seriesItem);
                  },
                  childCount: series.length,
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error loading series',
              style: TextStyle(fontSize: 18, color: Colors.red[700]),
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeriesCard(BuildContext context, Series series) {
    return Hero(
      tag: 'series-${series.id}',
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            // TODO: Navigate to series detail screen with Hero animation
            NavigationService.pushWithHero(
              context,
              // Placeholder for series detail screen
              Scaffold(
                appBar: AppBar(
                  title: Text(series.name),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'series-cover-${series.id}',
                        child: SeriesCoverService.buildSeriesCover(
                          context,
                          series.id,
                          series.name,
                          series.numBooks,
                          width: 300,
                          height: 180,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        series.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      if (series.description != null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(series.description!),
                        ),
                    ],
                  ),
                ),
              ),
              'series-cover-${series.id}',
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Series cover using same style as Home screen with Hero animation
              SeriesCoverService.buildSeriesCover(
                context,
                series.id,
                series.name,
                series.numBooks,
              ),
              // Series info
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        series.name,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (series.description != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          series.description!,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      const Spacer(),
                      Text(
                        '${series.numBooks} book${series.numBooks != 1 ? 's' : ''}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
