import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info_response.freezed.dart';
part 'device_info_response.g.dart';

@freezed
class DeviceInfoResponse with _$DeviceInfoResponse {
  const factory DeviceInfoResponse({required String clientVersion}) =
      _DeviceInfoResponse;

  factory DeviceInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoResponseFromJson(json);
}
