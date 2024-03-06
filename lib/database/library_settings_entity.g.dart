// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_settings_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LibrarySettingsEntitySchema = Schema(
  name: r'LibrarySettingsEntity',
  id: 1316238811514420573,
  properties: {
    r'audiobooksOnly': PropertySchema(
      id: 0,
      name: r'audiobooksOnly',
      type: IsarType.bool,
    ),
    r'autoScanCronExpression': PropertySchema(
      id: 1,
      name: r'autoScanCronExpression',
      type: IsarType.string,
    ),
    r'coverAspectRatio': PropertySchema(
      id: 2,
      name: r'coverAspectRatio',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.long,
    ),
    r'disableWatcher': PropertySchema(
      id: 4,
      name: r'disableWatcher',
      type: IsarType.bool,
    ),
    r'hideSingleBookSeries': PropertySchema(
      id: 5,
      name: r'hideSingleBookSeries',
      type: IsarType.bool,
    ),
    r'lastScan': PropertySchema(
      id: 6,
      name: r'lastScan',
      type: IsarType.long,
    ),
    r'lastScanVersion': PropertySchema(
      id: 7,
      name: r'lastScanVersion',
      type: IsarType.string,
    ),
    r'lastUpdate': PropertySchema(
      id: 8,
      name: r'lastUpdate',
      type: IsarType.long,
    ),
    r'metadataPrecedence': PropertySchema(
      id: 9,
      name: r'metadataPrecedence',
      type: IsarType.stringList,
    ),
    r'skipMatchingMediaWithAsin': PropertySchema(
      id: 10,
      name: r'skipMatchingMediaWithAsin',
      type: IsarType.bool,
    ),
    r'skipMatchingMediaWithIsbn': PropertySchema(
      id: 11,
      name: r'skipMatchingMediaWithIsbn',
      type: IsarType.bool,
    )
  },
  estimateSize: _librarySettingsEntityEstimateSize,
  serialize: _librarySettingsEntitySerialize,
  deserialize: _librarySettingsEntityDeserialize,
  deserializeProp: _librarySettingsEntityDeserializeProp,
);

int _librarySettingsEntityEstimateSize(
  LibrarySettingsEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.autoScanCronExpression;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastScanVersion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.metadataPrecedence.length * 3;
  {
    for (var i = 0; i < object.metadataPrecedence.length; i++) {
      final value = object.metadataPrecedence[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _librarySettingsEntitySerialize(
  LibrarySettingsEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.audiobooksOnly);
  writer.writeString(offsets[1], object.autoScanCronExpression);
  writer.writeLong(offsets[2], object.coverAspectRatio);
  writer.writeLong(offsets[3], object.createdAt);
  writer.writeBool(offsets[4], object.disableWatcher);
  writer.writeBool(offsets[5], object.hideSingleBookSeries);
  writer.writeLong(offsets[6], object.lastScan);
  writer.writeString(offsets[7], object.lastScanVersion);
  writer.writeLong(offsets[8], object.lastUpdate);
  writer.writeStringList(offsets[9], object.metadataPrecedence);
  writer.writeBool(offsets[10], object.skipMatchingMediaWithAsin);
  writer.writeBool(offsets[11], object.skipMatchingMediaWithIsbn);
}

LibrarySettingsEntity _librarySettingsEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LibrarySettingsEntity();
  object.audiobooksOnly = reader.readBool(offsets[0]);
  object.autoScanCronExpression = reader.readStringOrNull(offsets[1]);
  object.coverAspectRatio = reader.readLong(offsets[2]);
  object.createdAt = reader.readLongOrNull(offsets[3]);
  object.disableWatcher = reader.readBool(offsets[4]);
  object.hideSingleBookSeries = reader.readBool(offsets[5]);
  object.lastScan = reader.readLongOrNull(offsets[6]);
  object.lastScanVersion = reader.readStringOrNull(offsets[7]);
  object.lastUpdate = reader.readLongOrNull(offsets[8]);
  object.metadataPrecedence = reader.readStringList(offsets[9]) ?? [];
  object.skipMatchingMediaWithAsin = reader.readBool(offsets[10]);
  object.skipMatchingMediaWithIsbn = reader.readBool(offsets[11]);
  return object;
}

P _librarySettingsEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LibrarySettingsEntityQueryFilter on QueryBuilder<
    LibrarySettingsEntity, LibrarySettingsEntity, QFilterCondition> {
  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> audiobooksOnlyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audiobooksOnly',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> autoScanCronExpressionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'autoScanCronExpression',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> autoScanCronExpressionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'autoScanCronExpression',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> autoScanCronExpressionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoScanCronExpression',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> autoScanCronExpressionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'autoScanCronExpression',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> autoScanCronExpressionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'autoScanCronExpression',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> autoScanCronExpressionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'autoScanCronExpression',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> autoScanCronExpressionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'autoScanCronExpression',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> autoScanCronExpressionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'autoScanCronExpression',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
          QAfterFilterCondition>
      autoScanCronExpressionContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'autoScanCronExpression',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
          QAfterFilterCondition>
      autoScanCronExpressionMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'autoScanCronExpression',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> autoScanCronExpressionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoScanCronExpression',
        value: '',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> autoScanCronExpressionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'autoScanCronExpression',
        value: '',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> coverAspectRatioEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverAspectRatio',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> coverAspectRatioGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverAspectRatio',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> coverAspectRatioLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverAspectRatio',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> coverAspectRatioBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverAspectRatio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> createdAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> createdAtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> createdAtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> createdAtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> disableWatcherEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disableWatcher',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> hideSingleBookSeriesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hideSingleBookSeries',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastScan',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastScan',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastScan',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastScan',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastScan',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastScan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastScanVersion',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastScanVersion',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanVersionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastScanVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanVersionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastScanVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanVersionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastScanVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanVersionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastScanVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanVersionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastScanVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanVersionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastScanVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
          QAfterFilterCondition>
      lastScanVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastScanVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
          QAfterFilterCondition>
      lastScanVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastScanVersion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastScanVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastScanVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastScanVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastUpdateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdate',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastUpdateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdate',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastUpdateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastUpdateGreaterThan(
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

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastUpdateLessThan(
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

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> lastUpdateBetween(
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

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metadataPrecedence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metadataPrecedence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metadataPrecedence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metadataPrecedence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'metadataPrecedence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'metadataPrecedence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
          QAfterFilterCondition>
      metadataPrecedenceElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metadataPrecedence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
          QAfterFilterCondition>
      metadataPrecedenceElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metadataPrecedence',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metadataPrecedence',
        value: '',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metadataPrecedence',
        value: '',
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataPrecedence',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataPrecedence',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataPrecedence',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataPrecedence',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataPrecedence',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> metadataPrecedenceLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataPrecedence',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> skipMatchingMediaWithAsinEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skipMatchingMediaWithAsin',
        value: value,
      ));
    });
  }

  QueryBuilder<LibrarySettingsEntity, LibrarySettingsEntity,
      QAfterFilterCondition> skipMatchingMediaWithIsbnEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skipMatchingMediaWithIsbn',
        value: value,
      ));
    });
  }
}

extension LibrarySettingsEntityQueryObject on QueryBuilder<
    LibrarySettingsEntity, LibrarySettingsEntity, QFilterCondition> {}
