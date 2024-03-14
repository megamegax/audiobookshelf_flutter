import 'package:audiobookshelf_flutter/database/series.dart';
import 'package:audiobookshelf_flutter/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeriesDetails extends ConsumerWidget {
  final Series series;
  const SeriesDetails({super.key, required this.series});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Hero(
              tag: 'bookTitle${series.name}',
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(series.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white)))),
        ),
        body: SingleChildScrollView(
            child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Wrap(
                children:
                    series.books.map((e) => BookCard(libraryItem: e)).toList(),
              ),
            ),
          ),
        )));
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
