// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LibraryItemResponse _$LibraryItemResponseFromJson(Map<String, dynamic> json) =>
    _LibraryItemResponse(
      result: DetailedLibraryItem.fromJson(
        json['result'] as Map<String, dynamic>,
      ),
      total: (json['total'] as num).toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      sortBy: json['sortBy'] as String?,
      sortDesc: json['sortDesc'] as bool,
      filterBy: json['filterBy'] as String?,
      mediaType: json['mediaType'] as String,
      minified: json['minified'] as bool,
      collapseseries: json['collapseseries'] as bool,
      include: json['include'] as String?,
    );

Map<String, dynamic> _$LibraryItemResponseToJson(
  _LibraryItemResponse instance,
) => <String, dynamic>{
  'result': instance.result,
  'total': instance.total,
  'limit': instance.limit,
  'page': instance.page,
  'sortBy': instance.sortBy,
  'sortDesc': instance.sortDesc,
  'filterBy': instance.filterBy,
  'mediaType': instance.mediaType,
  'minified': instance.minified,
  'collapseseries': instance.collapseseries,
  'include': instance.include,
};
