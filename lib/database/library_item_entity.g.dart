// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_item_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLibraryItemEntityCollection on Isar {
  IsarCollection<LibraryItemEntity> get libraryItemEntitys => this.collection();
}

const LibraryItemEntitySchema = CollectionSchema(
  name: r'LibraryItemEntity',
  id: -4729946763810728935,
  properties: {
    r'addedAt': PropertySchema(
      id: 0,
      name: r'addedAt',
      type: IsarType.long,
    ),
    r'birthtimeMs': PropertySchema(
      id: 1,
      name: r'birthtimeMs',
      type: IsarType.long,
    ),
    r'ctimeMs': PropertySchema(
      id: 2,
      name: r'ctimeMs',
      type: IsarType.long,
    ),
    r'folderId': PropertySchema(
      id: 3,
      name: r'folderId',
      type: IsarType.string,
    ),
    r'ino': PropertySchema(
      id: 4,
      name: r'ino',
      type: IsarType.string,
    ),
    r'isFile': PropertySchema(
      id: 5,
      name: r'isFile',
      type: IsarType.bool,
    ),
    r'isMissing': PropertySchema(
      id: 6,
      name: r'isMissing',
      type: IsarType.bool,
    ),
    r'itemId': PropertySchema(
      id: 7,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'libraryId': PropertySchema(
      id: 8,
      name: r'libraryId',
      type: IsarType.string,
    ),
    r'mediaProgress': PropertySchema(
      id: 9,
      name: r'mediaProgress',
      type: IsarType.object,
      target: r'MediaProgressEntity',
    ),
    r'mtimeMs': PropertySchema(
      id: 10,
      name: r'mtimeMs',
      type: IsarType.long,
    ),
    r'path': PropertySchema(
      id: 11,
      name: r'path',
      type: IsarType.string,
    ),
    r'relPath': PropertySchema(
      id: 12,
      name: r'relPath',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.long,
    )
  },
  estimateSize: _libraryItemEntityEstimateSize,
  serialize: _libraryItemEntitySerialize,
  deserialize: _libraryItemEntityDeserialize,
  deserializeProp: _libraryItemEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'itemId': IndexSchema(
      id: -5342806140158601489,
      name: r'itemId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'itemId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'MediaProgressEntity': MediaProgressEntitySchema},
  getId: _libraryItemEntityGetId,
  getLinks: _libraryItemEntityGetLinks,
  attach: _libraryItemEntityAttach,
  version: '3.1.0+1',
);

int _libraryItemEntityEstimateSize(
  LibraryItemEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.folderId.length * 3;
  bytesCount += 3 + object.ino.length * 3;
  {
    final value = object.itemId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.libraryId.length * 3;
  {
    final value = object.mediaProgress;
    if (value != null) {
      bytesCount += 3 +
          MediaProgressEntitySchema.estimateSize(
              value, allOffsets[MediaProgressEntity]!, allOffsets);
    }
  }
  bytesCount += 3 + object.path.length * 3;
  bytesCount += 3 + object.relPath.length * 3;
  return bytesCount;
}

void _libraryItemEntitySerialize(
  LibraryItemEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.addedAt);
  writer.writeLong(offsets[1], object.birthtimeMs);
  writer.writeLong(offsets[2], object.ctimeMs);
  writer.writeString(offsets[3], object.folderId);
  writer.writeString(offsets[4], object.ino);
  writer.writeBool(offsets[5], object.isFile);
  writer.writeBool(offsets[6], object.isMissing);
  writer.writeString(offsets[7], object.itemId);
  writer.writeString(offsets[8], object.libraryId);
  writer.writeObject<MediaProgressEntity>(
    offsets[9],
    allOffsets,
    MediaProgressEntitySchema.serialize,
    object.mediaProgress,
  );
  writer.writeLong(offsets[10], object.mtimeMs);
  writer.writeString(offsets[11], object.path);
  writer.writeString(offsets[12], object.relPath);
  writer.writeLong(offsets[13], object.updatedAt);
}

LibraryItemEntity _libraryItemEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LibraryItemEntity(
    addedAt: reader.readLong(offsets[0]),
    birthtimeMs: reader.readLong(offsets[1]),
    ctimeMs: reader.readLong(offsets[2]),
    folderId: reader.readString(offsets[3]),
    ino: reader.readString(offsets[4]),
    isFile: reader.readBool(offsets[5]),
    isMissing: reader.readBool(offsets[6]),
    itemId: reader.readStringOrNull(offsets[7]),
    libraryId: reader.readString(offsets[8]),
    mediaProgress: reader.readObjectOrNull<MediaProgressEntity>(
      offsets[9],
      MediaProgressEntitySchema.deserialize,
      allOffsets,
    ),
    mtimeMs: reader.readLong(offsets[10]),
    path: reader.readString(offsets[11]),
    relPath: reader.readString(offsets[12]),
    updatedAt: reader.readLongOrNull(offsets[13]),
  );
  object.id = id;
  return object;
}

P _libraryItemEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readObjectOrNull<MediaProgressEntity>(
        offset,
        MediaProgressEntitySchema.deserialize,
        allOffsets,
      )) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _libraryItemEntityGetId(LibraryItemEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _libraryItemEntityGetLinks(
    LibraryItemEntity object) {
  return [];
}

void _libraryItemEntityAttach(
    IsarCollection<dynamic> col, Id id, LibraryItemEntity object) {
  object.id = id;
}

extension LibraryItemEntityQueryWhereSort
    on QueryBuilder<LibraryItemEntity, LibraryItemEntity, QWhere> {
  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LibraryItemEntityQueryWhere
    on QueryBuilder<LibraryItemEntity, LibraryItemEntity, QWhereClause> {
  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterWhereClause>
      itemIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'itemId',
        value: [null],
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterWhereClause>
      itemIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'itemId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterWhereClause>
      itemIdEqualTo(String? itemId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'itemId',
        value: [itemId],
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterWhereClause>
      itemIdNotEqualTo(String? itemId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [],
              upper: [itemId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [itemId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [itemId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [],
              upper: [itemId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension LibraryItemEntityQueryFilter
    on QueryBuilder<LibraryItemEntity, LibraryItemEntity, QFilterCondition> {
  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      addedAtEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      addedAtGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      addedAtLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      addedAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      birthtimeMsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birthtimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      birthtimeMsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'birthtimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      birthtimeMsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'birthtimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      birthtimeMsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'birthtimeMs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      ctimeMsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ctimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      ctimeMsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ctimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      ctimeMsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ctimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      ctimeMsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ctimeMs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      folderIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'folderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      folderIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'folderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      folderIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'folderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      folderIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'folderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      folderIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'folderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      folderIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'folderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      folderIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'folderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      folderIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'folderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      folderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'folderId',
        value: '',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      folderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'folderId',
        value: '',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      inoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ino',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      inoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ino',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      inoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ino',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      inoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ino',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      inoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ino',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      inoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ino',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      inoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ino',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      inoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ino',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      inoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ino',
        value: '',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      inoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ino',
        value: '',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      isFileEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFile',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      isMissingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMissing',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      itemIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemId',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      itemIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemId',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
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

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
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

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
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

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
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

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
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

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
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

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      itemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      libraryIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'libraryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      libraryIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'libraryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      libraryIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'libraryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      libraryIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'libraryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      libraryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'libraryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      libraryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'libraryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      libraryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'libraryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      libraryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'libraryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      libraryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'libraryId',
        value: '',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      libraryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'libraryId',
        value: '',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      mediaProgressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mediaProgress',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      mediaProgressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mediaProgress',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      mtimeMsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mtimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      mtimeMsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mtimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      mtimeMsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mtimeMs',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      mtimeMsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mtimeMs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      pathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      pathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      pathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      pathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'path',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      pathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      pathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      pathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      pathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path',
        value: '',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'path',
        value: '',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      relPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      relPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      relPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      relPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      relPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'relPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      relPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'relPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      relPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'relPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      relPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'relPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      relPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relPath',
        value: '',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      relPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'relPath',
        value: '',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      updatedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      updatedAtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      updatedAtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      updatedAtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LibraryItemEntityQueryObject
    on QueryBuilder<LibraryItemEntity, LibraryItemEntity, QFilterCondition> {
  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterFilterCondition>
      mediaProgress(FilterQuery<MediaProgressEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'mediaProgress');
    });
  }
}

extension LibraryItemEntityQueryLinks
    on QueryBuilder<LibraryItemEntity, LibraryItemEntity, QFilterCondition> {}

extension LibraryItemEntityQuerySortBy
    on QueryBuilder<LibraryItemEntity, LibraryItemEntity, QSortBy> {
  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByAddedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByBirthtimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthtimeMs', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByBirthtimeMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthtimeMs', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByCtimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctimeMs', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByCtimeMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctimeMs', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByFolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folderId', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByFolderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folderId', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy> sortByIno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ino', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByInoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ino', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByIsFile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFile', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByIsFileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFile', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByIsMissing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMissing', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByIsMissingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMissing', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByLibraryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryId', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByLibraryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryId', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByMtimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mtimeMs', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByMtimeMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mtimeMs', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByRelPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relPath', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByRelPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relPath', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LibraryItemEntityQuerySortThenBy
    on QueryBuilder<LibraryItemEntity, LibraryItemEntity, QSortThenBy> {
  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByAddedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByBirthtimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthtimeMs', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByBirthtimeMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthtimeMs', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByCtimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctimeMs', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByCtimeMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctimeMs', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByFolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folderId', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByFolderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folderId', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy> thenByIno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ino', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByInoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ino', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByIsFile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFile', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByIsFileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFile', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByIsMissing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMissing', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByIsMissingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMissing', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByLibraryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryId', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByLibraryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryId', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByMtimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mtimeMs', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByMtimeMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mtimeMs', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByRelPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relPath', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByRelPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relPath', Sort.desc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LibraryItemEntityQueryWhereDistinct
    on QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct> {
  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct>
      distinctByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedAt');
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct>
      distinctByBirthtimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birthtimeMs');
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct>
      distinctByCtimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ctimeMs');
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct>
      distinctByFolderId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'folderId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct> distinctByIno(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ino', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct>
      distinctByIsFile() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFile');
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct>
      distinctByIsMissing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMissing');
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct>
      distinctByItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct>
      distinctByLibraryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'libraryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct>
      distinctByMtimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mtimeMs');
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct> distinctByPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'path', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct>
      distinctByRelPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LibraryItemEntity, LibraryItemEntity, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension LibraryItemEntityQueryProperty
    on QueryBuilder<LibraryItemEntity, LibraryItemEntity, QQueryProperty> {
  QueryBuilder<LibraryItemEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LibraryItemEntity, int, QQueryOperations> addedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedAt');
    });
  }

  QueryBuilder<LibraryItemEntity, int, QQueryOperations> birthtimeMsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birthtimeMs');
    });
  }

  QueryBuilder<LibraryItemEntity, int, QQueryOperations> ctimeMsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ctimeMs');
    });
  }

  QueryBuilder<LibraryItemEntity, String, QQueryOperations> folderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'folderId');
    });
  }

  QueryBuilder<LibraryItemEntity, String, QQueryOperations> inoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ino');
    });
  }

  QueryBuilder<LibraryItemEntity, bool, QQueryOperations> isFileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFile');
    });
  }

  QueryBuilder<LibraryItemEntity, bool, QQueryOperations> isMissingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMissing');
    });
  }

  QueryBuilder<LibraryItemEntity, String?, QQueryOperations> itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<LibraryItemEntity, String, QQueryOperations>
      libraryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'libraryId');
    });
  }

  QueryBuilder<LibraryItemEntity, MediaProgressEntity?, QQueryOperations>
      mediaProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mediaProgress');
    });
  }

  QueryBuilder<LibraryItemEntity, int, QQueryOperations> mtimeMsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mtimeMs');
    });
  }

  QueryBuilder<LibraryItemEntity, String, QQueryOperations> pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'path');
    });
  }

  QueryBuilder<LibraryItemEntity, String, QQueryOperations> relPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relPath');
    });
  }

  QueryBuilder<LibraryItemEntity, int?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
