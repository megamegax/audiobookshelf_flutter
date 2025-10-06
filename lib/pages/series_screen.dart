import 'package:audiobookshelf_flutter/model/series.dart';
import 'package:audiobookshelf_flutter/layouts/responsive_layout.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/services/series_cover_service.dart';
import 'package:audiobookshelf_flutter/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Mock data for now - will be replaced with actual API calls
final mockSeries = [
  Series(
    id: 'series1',
    name: 'Harry Potter',
    description: 'The beloved fantasy series about a young wizard.',
    numBooks: 7,
  ),
  Series(
    id: 'series2',
    name: 'The Dark Tower',
    description: 'Stephen King\'s epic fantasy western series.',
    numBooks: 8,
  ),
  Series(
    id: 'series3',
    name: 'A Song of Ice and Fire',
    description: 'The epic fantasy series that inspired Game of Thrones.',
    numBooks: 5,
  ),
  Series(
    id: 'series4',
    name: 'Discworld',
    description: 'Terry Pratchett\'s humorous fantasy series.',
    numBooks: 41,
  ),
  Series(
    id: 'series5',
    name: 'The Wheel of Time',
    description: 'Robert Jordan\'s epic high fantasy series.',
    numBooks: 14,
  ),
  Series(
    id: 'series6',
    name: 'Foundation',
    description: 'Isaac Asimov\'s science fiction series about psychohistory.',
    numBooks: 7,
  ),
];

class SeriesScreen extends ConsumerWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverSettings = ref.read(serverSettingsNotifierProvider);

    return ResponsiveLayout(
      body: _buildBody(context),
      title: 'Series',
      selectedDrawerItem: SelectedItem.series,
      serverSettings: serverSettings,
    );
  }

  Widget _buildBody(BuildContext context) {
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
                final series = mockSeries[index];
                return _buildSeriesCard(context, series);
              },
              childCount: mockSeries.length,
            ),
          ),
        ),
      ],
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
              Hero(
                tag: 'series-cover-${series.id}',
                child: SeriesCoverService.buildSeriesCover(
                  context,
                  series.id,
                  series.name,
                  series.numBooks,
                ),
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
