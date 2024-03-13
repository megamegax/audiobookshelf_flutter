import 'dart:typed_data';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item.dart';
import 'package:audiobookshelf_flutter/pages/book_details.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final LibraryItemEntity libraryItem;
  const BookCard({super.key, required this.libraryItem});
  @override
  Widget build(BuildContext context) {
    final double progress = libraryItem.media.progress == null
        ? 0
        : libraryItem.media.progress!.isFinished
            ? 100
            : ((libraryItem.media.progress!.currentTime ?? 0.0) /
                (libraryItem.media.duration ?? 0.0) *
                100);

    return SizedBox(
      width: 200,
      height: 300,
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => BookDetails(
                        item: libraryItem,
                      )),
            );
          },
          child: Column(
            children: [
              Hero(
                  tag: 'bookImage${libraryItem.itemId ?? ""}',
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.memory(
                        Uint8List.fromList(libraryItem.media.coverBytes ?? []),
                        fit: BoxFit.cover),
                  )),
              LinearProgressIndicator(
                value: progress,
                color: progress == 100
                    ? Colors.green
                    : Theme.of(context).colorScheme.primary,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                    tag: 'bookTitle${libraryItem.itemId ?? ""}',
                    child: Text(
                      libraryItem.media.metadata?.title ?? "-",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium!
                          .copyWith(
                              color: Theme.of(context).colorScheme.onSurface),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
