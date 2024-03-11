// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MediaEntitySchema = Schema(
  name: r'MediaEntity',
  id: -6918515590517454333,
  properties: {
    r'coverBytes': PropertySchema(
      id: 0,
      name: r'coverBytes',
      type: IsarType.longList,
    ),
    r'coverPath': PropertySchema(
      id: 1,
      name: r'coverPath',
      type: IsarType.string,
    ),
    r'duration': PropertySchema(
      id: 2,
      name: r'duration',
      type: IsarType.double,
    ),
    r'ebookFileFormat': PropertySchema(
      id: 3,
      name: r'ebookFileFormat',
      type: IsarType.string,
    ),
    r'metadata': PropertySchema(
      id: 4,
      name: r'metadata',
      type: IsarType.object,
      target: r'MetadataEntity',
    ),
    r'numAudioFiles': PropertySchema(
      id: 5,
      name: r'numAudioFiles',
      type: IsarType.long,
    ),
    r'numChapters': PropertySchema(
      id: 6,
      name: r'numChapters',
      type: IsarType.long,
    ),
    r'numInvalidAudioFiles': PropertySchema(
      id: 7,
      name: r'numInvalidAudioFiles',
      type: IsarType.long,
    ),
    r'numMissingParts': PropertySchema(
      id: 8,
      name: r'numMissingParts',
      type: IsarType.long,
    ),
    r'numTracks': PropertySchema(
      id: 9,
      name: r'numTracks',
      type: IsarType.long,
    ),
    r'progress': PropertySchema(
      id: 10,
      name: r'progress',
      type: IsarType.object,
      target: r'MediaProgressEntity',
    ),
    r'size': PropertySchema(
      id: 11,
      name: r'size',
      type: IsarType.long,
    ),
    r'tags': PropertySchema(
      id: 12,
      name: r'tags',
      type: IsarType.stringList,
    )
  },
  estimateSize: _mediaEntityEstimateSize,
  serialize: _mediaEntitySerialize,
  deserialize: _mediaEntityDeserialize,
  deserializeProp: _mediaEntityDeserializeProp,
);

int _mediaEntityEstimateSize(
  MediaEntity object,
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
    final value = object.coverPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ebookFileFormat;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.metadata;
    if (value != null) {
      bytesCount += 3 +
          MetadataEntitySchema.estimateSize(
              value, allOffsets[MetadataEntity]!, allOffsets);
    }
  }
  {
    final value = object.progress;
    if (value != null) {
      bytesCount += 3 +
          MediaProgressEntitySchema.estimateSize(
              value, allOffsets[MediaProgressEntity]!, allOffsets);
    }
  }
  {
    final list = object.tags;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _mediaEntitySerialize(
  MediaEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.coverBytes);
  writer.writeString(offsets[1], object.coverPath);
  writer.writeDouble(offsets[2], object.duration);
  writer.writeString(offsets[3], object.ebookFileFormat);
  writer.writeObject<MetadataEntity>(
    offsets[4],
    allOffsets,
    MetadataEntitySchema.serialize,
    object.metadata,
  );
  writer.writeLong(offsets[5], object.numAudioFiles);
  writer.writeLong(offsets[6], object.numChapters);
  writer.writeLong(offsets[7], object.numInvalidAudioFiles);
  writer.writeLong(offsets[8], object.numMissingParts);
  writer.writeLong(offsets[9], object.numTracks);
  writer.writeObject<MediaProgressEntity>(
    offsets[10],
    allOffsets,
    MediaProgressEntitySchema.serialize,
    object.progress,
  );
  writer.writeLong(offsets[11], object.size);
  writer.writeStringList(offsets[12], object.tags);
}

MediaEntity _mediaEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MediaEntity(
    coverBytes: reader.readLongList(offsets[0]),
    coverPath: reader.readStringOrNull(offsets[1]),
    duration: reader.readDoubleOrNull(offsets[2]),
    ebookFileFormat: reader.readStringOrNull(offsets[3]),
    metadata: reader.readObjectOrNull<MetadataEntity>(
      offsets[4],
      MetadataEntitySchema.deserialize,
      allOffsets,
    ),
    numAudioFiles: reader.readLongOrNull(offsets[5]),
    numChapters: reader.readLongOrNull(offsets[6]),
    numInvalidAudioFiles: reader.readLongOrNull(offsets[7]),
    numMissingParts: reader.readLongOrNull(offsets[8]),
    numTracks: reader.readLongOrNull(offsets[9]),
    progress: reader.readObjectOrNull<MediaProgressEntity>(
      offsets[10],
      MediaProgressEntitySchema.deserialize,
      allOffsets,
    ),
    size: reader.readLongOrNull(offsets[11]),
    tags: reader.readStringList(offsets[12]),
  );
  return object;
}

P _mediaEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<MetadataEntity>(
        offset,
        MetadataEntitySchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readObjectOrNull<MediaProgressEntity>(
        offset,
        MediaProgressEntitySchema.deserialize,
        allOffsets,
      )) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MediaEntityQueryFilter
    on QueryBuilder<MediaEntity, MediaEntity, QFilterCondition> {
  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coverBytes',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coverBytes',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverBytesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coverPath',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coverPath',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coverPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coverPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverPath',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      coverPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverPath',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition> durationEqualTo(
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition> durationBetween(
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

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      ebookFileFormatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ebookFileFormat',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      ebookFileFormatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ebookFileFormat',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      ebookFileFormatEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ebookFileFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      ebookFileFormatGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ebookFileFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      ebookFileFormatLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ebookFileFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      ebookFileFormatBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ebookFileFormat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      ebookFileFormatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ebookFileFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      ebookFileFormatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ebookFileFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      ebookFileFormatContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ebookFileFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      ebookFileFormatMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ebookFileFormat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      ebookFileFormatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ebookFileFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      ebookFileFormatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ebookFileFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      metadataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'metadata',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      metadataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'metadata',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numAudioFilesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numAudioFiles',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numAudioFilesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numAudioFiles',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numAudioFilesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numAudioFiles',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numAudioFilesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numAudioFiles',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numAudioFilesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numAudioFiles',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numAudioFilesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numAudioFiles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numChaptersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numChapters',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numChaptersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numChapters',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numChaptersEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numChapters',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numChaptersGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numChapters',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numChaptersLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numChapters',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numChaptersBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numChapters',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numInvalidAudioFilesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numInvalidAudioFiles',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numInvalidAudioFilesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numInvalidAudioFiles',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numInvalidAudioFilesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numInvalidAudioFiles',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numInvalidAudioFilesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numInvalidAudioFiles',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numInvalidAudioFilesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numInvalidAudioFiles',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numInvalidAudioFilesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numInvalidAudioFiles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numMissingPartsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numMissingParts',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numMissingPartsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numMissingParts',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numMissingPartsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numMissingParts',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numMissingPartsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numMissingParts',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numMissingPartsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numMissingParts',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numMissingPartsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numMissingParts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numTracksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numTracks',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numTracksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numTracks',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numTracksEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numTracks',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numTracksGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numTracks',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numTracksLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numTracks',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      numTracksBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numTracks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      progressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'progress',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      progressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'progress',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition> sizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      sizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition> sizeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition> sizeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'size',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition> sizeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'size',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition> sizeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'size',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition> tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition>
      tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension MediaEntityQueryObject
    on QueryBuilder<MediaEntity, MediaEntity, QFilterCondition> {
  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition> metadata(
      FilterQuery<MetadataEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'metadata');
    });
  }

  QueryBuilder<MediaEntity, MediaEntity, QAfterFilterCondition> progress(
      FilterQuery<MediaProgressEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'progress');
    });
  }
}
