// Feed your own stream of bytes into the player
import 'dart:async';

import 'package:just_audio/just_audio.dart';

class MyCustomSource extends StreamAudioSource {
  final Stream<dynamic> bytes;
  MyCustomSource(this.bytes);

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    start ??= 0;
    end ??= start + 1024;
    Stream<List<int>> byteStream =
        bytes.transform(StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        sink.add([data]);
      },
    ));
    return StreamAudioResponse(
      sourceLength: end,
      contentLength: end - start,
      offset: start,
      stream: byteStream,
      contentType: 'audio/mpeg',
    );
  }
}
