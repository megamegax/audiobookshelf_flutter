import 'package:audiobookshelf_flutter/database/series.dart';
import 'package:audiobookshelf_flutter/pages/series_details.dart';
import 'package:audiobookshelf_flutter/widgets/series_cover_widget.dart';
import 'package:audiobookshelf_flutter/services/navigation_service.dart';
import 'package:flutter/material.dart';

class SeriesCard extends StatelessWidget {
  final Series series;
  const SeriesCard({super.key, required this.series});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: Card(
        child: InkWell(
          onTap: () {
            NavigationService.pushWithHero(
              context,
              SeriesDetails(series: series),
              'series-cover-${series.seriesId}',
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Series cover with Hero animation
              Hero(
                tag: 'series-cover-${series.seriesId}',
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: SeriesCoverWidget(
                    series: series,
                    width: 200,
                    height: 180,
                    bookCoverAspectRatio: 1.6,
                  ),
                ),
              ),
              // Title
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    series.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
