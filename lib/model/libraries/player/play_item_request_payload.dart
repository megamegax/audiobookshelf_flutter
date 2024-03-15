import 'package:audiobookshelf_flutter/model/libraries/player/device_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_item_request_payload.freezed.dart';
part 'play_item_request_payload.g.dart';

@freezed
class PlayItemRequestPayload with _$PlayItemRequestPayload {
  const factory PlayItemRequestPayload(
      {required String itemId,
      required String mediaType,
      required String mediaPlayer,
      required bool forceDirectPlay,
      required bool forceTranscode,
      required DeviceInfo deviceInfo}) = _PlayItemRequestPayload;
  factory PlayItemRequestPayload.fromJson(Map<String, dynamic> json) =>
      _$PlayItemRequestPayloadFromJson(json);
}
