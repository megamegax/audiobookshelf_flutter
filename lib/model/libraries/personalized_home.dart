import 'package:freezed_annotation/freezed_annotation.dart';

part 'personalized_home.freezed.dart';
// part 'personalized_home.g.dart'; // Temporarily commented out due to build issues

enum SectionType {
  @JsonValue("continue-listening")
  continueListening,
  @JsonValue("continue-series")
  continueSeries,
  @JsonValue("recent-series")
  recentSeries,
  @JsonValue("recently-added")
  recentlyAdded,
  @JsonValue("newest-authors")
  newestAuthors,
  @JsonValue("discover")
  discover,
  @JsonValue("listen-again")
  listenAgain,
  @JsonValue("newest-episodes")
  newestEpisodes,
  @JsonValue("continue-podcast")
  continuePodcast,
  @JsonValue("recent-podcasts")
  recentPodcasts,
}

@freezed
sealed class PersonalizedHome with _$PersonalizedHome {
  const factory PersonalizedHome({
    required SectionType id,
    required String type,
    required List<PersonalizedEntity> entities,
  }) = _PersonalizedHome;

  // factory PersonalizedHome.fromJson(Map<String, dynamic> json) =>
  //     _$PersonalizedHomeFromJson(json); // Temporarily commented out due to build issues
}

@freezed
sealed class PersonalizedHomeEntity with _$PersonalizedHomeEntity {
  const factory PersonalizedHomeEntity({
    required SectionType id,
    required String type,
    required List<dynamic> entities,
  }) = _PersonalizedHomeEntity;
}

@freezed
sealed class PersonalizedEntity with _$PersonalizedEntity {
  const factory PersonalizedEntity({required String id}) = _PersonalizedEntity;

  // factory PersonalizedEntity.fromJson(Map<String, dynamic> json) =>
  //     _$PersonalizedEntityFromJson(json); // Temporarily commented out due to build issues
}
