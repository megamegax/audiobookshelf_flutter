// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LibraryItemsResponseImpl _$$LibraryItemsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LibraryItemsResponseImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => LibraryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      limit: json['limit'] as int,
      page: json['page'] as int,
      sortDesc: json['sortDesc'] as bool,
      mediaType: json['mediaType'] as String,
      minified: json['minified'] as bool,
      collapseseries: json['collapseseries'] as bool,
      include: json['include'] as String,
      offset: json['offset'] as int,
    );

Map<String, dynamic> _$$LibraryItemsResponseImplToJson(
        _$LibraryItemsResponseImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
      'total': instance.total,
      'limit': instance.limit,
      'page': instance.page,
      'sortDesc': instance.sortDesc,
      'mediaType': instance.mediaType,
      'minified': instance.minified,
      'collapseseries': instance.collapseseries,
      'include': instance.include,
      'offset': instance.offset,
    };
