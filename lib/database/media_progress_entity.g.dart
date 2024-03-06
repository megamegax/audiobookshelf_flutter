// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_progress_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MediaProgressEntitySchema = Schema(
  name: r'MediaProgressEntity',
  id: -6016900498692830462,
  properties: {
    r'coverBytes': PropertySchema(
      id: 0,
      name: r'coverBytes',
      type: IsarType.longList,
    ),
    r'currentTime': PropertySchema(
      id: 1,
      name: r'currentTime',
      type: IsarType.double,
    ),
    r'duration': PropertySchema(
      id: 2,
      name: r'duration',
      type: IsarType.double,
    ),
    r'ebookProgress': PropertySchema(
      id: 3,
      name: r'ebookProgress',
      type: IsarType.double,
    ),
    r'finishedAt': PropertySchema(
      id: 4,
      name: r'finishedAt',
      type: IsarType.long,
    ),
    r'hideFromContinueListening': PropertySchema(
      id: 5,
      name: r'hideFromContinueListening',
      type: IsarType.bool,
    ),
    r'isFinished': PropertySchema(
      id: 6,
      name: r'isFinished',
      type: IsarType.bool,
    ),
    r'itemId': PropertySchema(
      id: 7,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'lastUpdate': PropertySchema(
      id: 8,
      name: r'lastUpdate',
      type: IsarType.long,
    ),
    r'mediaItemType': PropertySchema(
      id: 9,
      name: r'mediaItemType',
      type: IsarType.string,
    ),
    r'progress': PropertySchema(
      id: 10,
      name: r'progress',
      type: IsarType.double,
    ),
    r'startedAt': PropertySchema(
      id: 11,
      name: r'startedAt',
      type: IsarType.long,
    )
  },
  estimateSize: _mediaProgressEntityEstimateSize,
  serialize: _mediaProgressEntitySerialize,
  deserialize: _mediaProgressEntityDeserialize,
  deserializeProp: _mediaProgressEntityDeserializeProp,
);

int _mediaProgressEntityEstimateSize(
  MediaProgressEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.coverBytes;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.itemId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mediaItemType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mediaProgressEntitySerialize(
  MediaProgressEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.coverBytes);
  writer.writeDouble(offsets[1], object.currentTime);
  writer.writeDouble(offsets[2], object.duration);
  writer.writeDouble(offsets[3], object.ebookProgress);
  writer.writeLong(offsets[4], object.finishedAt);
  writer.writeBool(offsets[5], object.hideFromContinueListening);
  writer.writeBool(offsets[6], object.isFinished);
  writer.writeString(offsets[7], object.itemId);
  writer.writeLong(offsets[8], object.lastUpdate);
  writer.writeString(offsets[9], object.mediaItemType);
  writer.writeDouble(offsets[10], object.progress);
  writer.writeLong(offsets[11], object.startedAt);
}

MediaProgressEntity _mediaProgressEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MediaProgressEntity(
    coverBytes: reader.readLongList(offsets[0]),
    currentTime: reader.readDoubleOrNull(offsets[1]),
    duration: reader.readDoubleOrNull(offsets[2]),
    ebookProgress: reader.readDoubleOrNull(offsets[3]),
    finishedAt: reader.readLongOrNull(offsets[4]),
    hideFromContinueListening: reader.readBoolOrNull(offsets[5]) ?? false,
    isFinished: reader.readBoolOrNull(offsets[6]) ?? false,
    itemId: reader.readStringOrNull(offsets[7]),
    lastUpdate: reader.readLongOrNull(offsets[8]),
    mediaItemType: reader.readStringOrNull(offsets[9]),
    progress: reader.readDoubleOrNull(offsets[10]),
    startedAt: reader.readLongOrNull(offsets[11]),
  );
  return object;
}

P _mediaProgressEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 6:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MediaProgressEntityQueryFilter on QueryBuilder<MediaProgressEntity,
    MediaProgressEntity, QFilterCondition> {
  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      coverBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coverBytes',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      coverBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coverBytes',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      coverBytesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      coverBytesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      coverBytesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      coverBytesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverBytes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      coverBytesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coverBytes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      coverBytesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coverBytes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      coverBytesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coverBytes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      coverBytesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coverBytes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      coverBytesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coverBytes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      coverBytesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coverBytes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      currentTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentTime',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      currentTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentTime',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      currentTimeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentTime',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      currentTimeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentTime',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      currentTimeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentTime',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      currentTimeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      durationEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      durationGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      durationLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      durationBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      ebookProgressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ebookProgress',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      ebookProgressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ebookProgress',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      ebookProgressEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ebookProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      ebookProgressGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ebookProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      ebookProgressLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ebookProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      ebookProgressBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ebookProgress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      finishedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finishedAt',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      finishedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finishedAt',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      finishedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finishedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      finishedAtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finishedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      finishedAtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finishedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      finishedAtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finishedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      hideFromContinueListeningEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hideFromContinueListening',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      isFinishedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFinished',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      itemIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemId',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      itemIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemId',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      itemIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      itemIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      itemIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      itemIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      itemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      itemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      itemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      lastUpdateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdate',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      lastUpdateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdate',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      lastUpdateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      lastUpdateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      lastUpdateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      lastUpdateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      mediaItemTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mediaItemType',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      mediaItemTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mediaItemType',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      mediaItemTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mediaItemType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      mediaItemTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mediaItemType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      mediaItemTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mediaItemType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      mediaItemTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mediaItemType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      mediaItemTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mediaItemType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      mediaItemTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mediaItemType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      mediaItemTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mediaItemType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      mediaItemTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mediaItemType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      mediaItemTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mediaItemType',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      mediaItemTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mediaItemType',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      progressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'progress',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      progressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'progress',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      progressEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      progressGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      progressLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      progressBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      startedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      startedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      startedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      startedAtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      startedAtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaProgressEntity, MediaProgressEntity, QAfterFilterCondition>
      startedAtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MediaProgressEntityQueryObject on QueryBuilder<MediaProgressEntity,
    MediaProgressEntity, QFilterCondition> {}
