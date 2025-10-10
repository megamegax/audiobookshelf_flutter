import 'package:audiobookshelf_flutter/database/series.dart';
import 'package:audiobookshelf_flutter/widgets/book_card.dart';
import 'package:audiobookshelf_flutter/widgets/series_cover_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeriesDetails extends ConsumerWidget {
  final Series series;
  final String? heroTag;
  const SeriesDetails({super.key, required this.series, this.heroTag});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'seriesTitle${series.seriesId}',
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              series.name,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Series cover image with Hero animation
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Hero(
                tag: heroTag ?? 'series-cover-${series.seriesId}',
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(
                          context,
                        ).colorScheme.shadow.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SeriesCoverWidget(
                      series: series,
                      width: 200,
                      height: 200,
                      bookCoverAspectRatio: 1.6,
                    ),
                  ),
                ),
              ),
            ),
            // Books grid
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'Books in this series: ${series.bookIds.length}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String durationToReadable(double durationInt) {
    final Duration duration = Duration(seconds: durationInt.toInt());
    String sDuration =
        "${duration.inHours} hr ${duration.inMinutes.remainder(60)} min";
    return sDuration;
  }

  String sizeToReadable(int sizeInBytes) {
    String mbSize = "${(sizeInBytes / 1024 / 1024).toStringAsFixed(2)} MB";
    if ((sizeInBytes / 1024 / 1024) >= 1024) {
      String gbSize =
          "${(sizeInBytes / 1024 / 1024 / 1024).toStringAsFixed(2)} GB";
      return gbSize;
    } else {
      return mbSize;
    }
  }
}
