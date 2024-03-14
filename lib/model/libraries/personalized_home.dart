import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personalized_home.freezed.dart';
part 'personalized_home.g.dart';

enum SectionType {
  @JsonValue("continue-listening")
  continueListening,
  @JsonValue("continue-series")
  continueSeries,
  @JsonValue("recent-series")
  recentSeries,
  @JsonValue("discover")
  discover,
  @JsonValue("listen-again")
  listenAgain,
}

@freezed
class PersonalizedHome with _$PersonalizedHome {
  const factory PersonalizedHome({
    required SectionType id,
    required String type,
    required List<PersonalizedEntity> entities,
  }) = _PersonalizedHome;

  factory PersonalizedHome.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedHomeFromJson(json);
}

@freezed
class PersonalizedHomeEntity with _$PersonalizedHomeEntity {
  const factory PersonalizedHomeEntity({
    required SectionType id,
    required String type,
    required List<dynamic> entities,
  }) = _PersonalizedHomeEntity;
}

@freezed
class PersonalizedEntity with _$PersonalizedEntity {
  const factory PersonalizedEntity({
    required String id,
  }) = _PersonalizedEntity;

  factory PersonalizedEntity.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedEntityFromJson(json);
}
