import 'dart:async';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/widgets/player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class BookDetails extends ConsumerStatefulWidget {
  final LibraryItemEntity item;

  const BookDetails({super.key, required this.item});

  @override
  ConsumerState<BookDetails> createState() {
    return BookDetailsState();
  }
}

class BookDetailsState extends ConsumerState<BookDetails> {
  late AudioPlayer _audioPlayer;
  late UserModel userModel;
  late LibraryService libraryService;
  double progress = 0;
  Uint8List coverBytes = Uint8List.fromList([]);
  bool playerPrepared = false;
  late StreamSubscription subscription;
  @override
  void initState() {
    _audioPlayer = ref.read(audioPlayerProvider);
    userModel = ref.read(userModelNotifierProvider)!;
    libraryService = ref.read(libraryServiceProvider);
    progress = widget.item.media.progress == null
        ? 0
        : widget.item.media.progress!.progress!;
    coverBytes = Uint8List.fromList(widget.item.media.coverBytes!);
    preparePlayer();

    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _audioPlayer.audioSource != null
          ? Player(source: _audioPlayer.audioSource!)
          : null,
      appBar: AppBar(
        title: Hero(
            tag: 'bookTitle${widget.item.itemId}',
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(widget.item.media.metadata?.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white)))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              bottom: _audioPlayer.audioSource != null ? 100.0 : 0),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 204,
                  child: Hero(
                    tag: 'bookImage${widget.item.itemId}',
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.memory(coverBytes, fit: BoxFit.cover),
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
                    Text(widget.item.media.metadata?.seriesName ?? "",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text("by ${widget.item.media.metadata?.authorName ?? ""}"),
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
                            Text(widget.item.media.metadata?.narratorName ?? "")
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
                            Text(
                                widget.item.media.metadata?.genres?.join(",") ??
                                    ""),
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
                            Text(durationToReadable(
                                widget.item.media.duration ?? 0)),
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
                            Text(sizeToReadable(widget.item.media.size ?? 0)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      if (_audioPlayer.playing) {
                        setState(() {
                          _audioPlayer.pause();
                          preparePlayer(autoStart: true);
                        });
                      } else {
                        setState(() {
                          _audioPlayer.play();
                        });
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                            playerPrepared && _audioPlayer.playing
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white),
                        const Text("Streaming",
                            style: TextStyle(color: Colors.white)),
                      ],
                    )),
                SizedBox(
                    height: 20,
                    child: LinearProgressIndicator(value: progress)),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      widget.item.media.metadata?.description ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  preparePlayer({bool autoStart = false}) async {
    if (_audioPlayer.playing) {
      final tag = _audioPlayer.audioSource!.sequence[0].tag as MediaItem;
      if (tag.id == widget.item.itemId.toString()) {
        setState(() {
          playerPrepared = true;
        });
      } else {
        return;
      }
      return;
    }
    final serverAddress = await ref.read(serverAddressLoaderProvider.future);
    final playbackSession =
        await libraryService.playBook(userModel, widget.item);
    print(
        "$serverAddress${playbackSession.audioTracks[0].contentUrl!}?token=${userModel.token}");
    await _audioPlayer.setAudioSource(AudioSource.uri(
      Uri.parse(
          "$serverAddress${playbackSession.audioTracks[0].contentUrl!}?token=${userModel.token}"),
      tag: MediaItem(
          id: widget.item.itemId.toString(),
          album: widget.item.media.metadata?.seriesName,
          title: widget.item.media.metadata?.title ?? "-",
          displayDescription: widget.item.media.metadata?.authorName ?? "-",
          extras: {"coverBytes": coverBytes, "item": widget.item},
          duration:
              Duration(seconds: widget.item.media.duration?.toInt() ?? 0)),
    ));
    setState(() {
      playerPrepared = true;
    });

    subscription = _audioPlayer.positionStream.listen((event) {
      setState(() {
        progress = event.inMilliseconds / _audioPlayer.duration!.inMilliseconds;
      });
    });
    if (autoStart) {
      _audioPlayer.play();
    }
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

  String durationToReadable(double durationInt) {
    final Duration duration = Duration(seconds: durationInt.toInt());
    String sDuration =
        "${duration.inHours} hr ${duration.inMinutes.remainder(60)} min";
    return sDuration;
  }
}

class StreamSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}

StreamSocket streamSocket = StreamSocket();
