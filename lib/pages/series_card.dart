import 'package:audiobookshelf_flutter/database/series.dart';
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
          onTap: () {},
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                    tag: 'seriesTitle${series.seriesId}',
                    child: Text(
                      series.name,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium!
                          .copyWith(
                              color: Theme.of(context).colorScheme.onSurface),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
