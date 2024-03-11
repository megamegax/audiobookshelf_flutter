// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetadataImpl _$$MetadataImplFromJson(Map<String, dynamic> json) =>
    _$MetadataImpl(
      title: json['title'] as String,
      titleIgnorePrefix: json['titleIgnorePrefix'] as String?,
      subtitle: json['subtitle'] as String?,
      authorName: json['authorName'] as String?,
      narratorName: json['narratorName'] as String?,
      seriesName: json['seriesName'] as String?,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      publishedYear: json['publishedYear'] as String?,
      publishedDate: json['publishedDate'] as String?,
      publisher: json['publisher'] as String?,
      description: json['description'] as String?,
      isbn: json['isbn'] as String?,
      asin: json['asin'] as String?,
      language: json['language'] as String?,
      explicit: json['explicit'] as bool,
    );

Map<String, dynamic> _$$MetadataImplToJson(_$MetadataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'titleIgnorePrefix': instance.titleIgnorePrefix,
      'subtitle': instance.subtitle,
      'authorName': instance.authorName,
      'narratorName': instance.narratorName,
      'seriesName': instance.seriesName,
      'genres': instance.genres,
      'publishedYear': instance.publishedYear,
      'publishedDate': instance.publishedDate,
      'publisher': instance.publisher,
      'description': instance.description,
      'isbn': instance.isbn,
      'asin': instance.asin,
      'language': instance.language,
      'explicit': instance.explicit,
    };
