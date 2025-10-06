import 'package:audiobookshelf_flutter/database/series.dart';
import 'package:audiobookshelf_flutter/pages/series_details.dart';
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
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SeriesDetails(
                  series: series,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: animation.drive(
                        Tween(begin: const Offset(0.0, 0.1), end: Offset.zero)
                            .chain(CurveTween(curve: Curves.easeOutCubic)),
                      ),
                      child: child,
                    ),
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
                reverseTransitionDuration: const Duration(milliseconds: 250),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cover image placeholder with Hero animation
              Hero(
                tag: 'seriesImage${series.seriesId}',
                child: Container(
                  width: 200,
                  height: 180,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Icon(
                    Icons.library_books,
                    size: 48,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              // Title
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                      tag: 'seriesTitle${series.seriesId}',
                      child: Text(
                        series.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
