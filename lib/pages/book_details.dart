import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookDetails extends ConsumerWidget {
  final LibraryItemEntity? item;
  const BookDetails({super.key, this.item});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double progress =
        item?.media.progress == null ? 0 : item!.media.progress!.progress!;
    return Scaffold(
      appBar: AppBar(
        title: Hero(
            tag: 'bookTitle${item?.itemId}',
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(item?.media.metadata?.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white)))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Hero(
                  tag: 'bookImage${item?.itemId}',
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.memory(
                            item?.media.coverBytes == null
                                ? Uint8List.fromList([])
                                : Uint8List.fromList(item!.media.coverBytes!),
                            fit: BoxFit.cover),
                        LinearProgressIndicator(
                          value: progress,
                          color: progress == 1
                              ? Colors.green
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item?.media.metadata?.seriesName ?? "",
                      style: Theme.of(context).textTheme.titleMedium),
                  Text("by ${item?.media.metadata?.authorName ?? ""}"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: 350,
                  child: Table(
                    columnWidths: const {
                      0: FractionColumnWidth(0.3),
                      1: FractionColumnWidth(0.7)
                    },
                    border: TableBorder.all(color: Colors.transparent),
                    children: [
                      TableRow(
                        children: [
                          Text(
                            "Narrators".toUpperCase(),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(item?.media.metadata?.narratorName ?? "")
                        ],
                      ),
                      const TableRow(
                        children: [
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            "Genres".toUpperCase(),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(item?.media.metadata?.genres?.join(",") ?? ""),
                        ],
                      ),
                      const TableRow(
                        children: [
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            "Duration".toUpperCase(),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(durationToReadable(item?.media.duration ?? 0)),
                        ],
                      ),
                      const TableRow(
                        children: [
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            "Size".toUpperCase(),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(sizeToReadable(item?.media.size ?? 0)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    item?.media.metadata?.description ?? "",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
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
