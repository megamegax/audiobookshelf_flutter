// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAuthorEntityCollection on Isar {
  IsarCollection<AuthorEntity> get authorEntitys => this.collection();
}

const AuthorEntitySchema = CollectionSchema(
  name: r'AuthorEntity',
  id: -3065176875856200404,
  properties: {
    r'addedAt': PropertySchema(
      id: 0,
      name: r'addedAt',
      type: IsarType.long,
    ),
    r'authorId': PropertySchema(
      id: 1,
      name: r'authorId',
      type: IsarType.string,
    ),
    r'bookCount': PropertySchema(
      id: 2,
      name: r'bookCount',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'imageBytes': PropertySchema(
      id: 4,
      name: r'imageBytes',
      type: IsarType.longList,
    ),
    r'imagePath': PropertySchema(
      id: 5,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'nameIgnorePrefix': PropertySchema(
      id: 7,
      name: r'nameIgnorePrefix',
      type: IsarType.string,
    ),
    r'seriesCount': PropertySchema(
      id: 8,
      name: r'seriesCount',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.long,
    )
  },
  estimateSize: _authorEntityEstimateSize,
  serialize: _authorEntitySerialize,
  deserialize: _authorEntityDeserialize,
  deserializeProp: _authorEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'authorId': IndexSchema(
      id: 8112877077417469315,
      name: r'authorId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'authorId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _authorEntityGetId,
  getLinks: _authorEntityGetLinks,
  attach: _authorEntityAttach,
  version: '3.3.0-dev.1',
);

int _authorEntityEstimateSize(
  AuthorEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.authorId.length * 3;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageBytes;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.imagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.nameIgnorePrefix;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _authorEntitySerialize(
  AuthorEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.addedAt);
  writer.writeString(offsets[1], object.authorId);
  writer.writeLong(offsets[2], object.bookCount);
  writer.writeString(offsets[3], object.description);
  writer.writeLongList(offsets[4], object.imageBytes);
  writer.writeString(offsets[5], object.imagePath);
  writer.writeString(offsets[6], object.name);
  writer.writeString(offsets[7], object.nameIgnorePrefix);
  writer.writeLong(offsets[8], object.seriesCount);
  writer.writeLong(offsets[9], object.updatedAt);
}

AuthorEntity _authorEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AuthorEntity();
  object.addedAt = reader.readLongOrNull(offsets[0]);
  object.authorId = reader.readString(offsets[1]);
  object.bookCount = reader.readLongOrNull(offsets[2]);
  object.description = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.imageBytes = reader.readLongList(offsets[4]);
  object.imagePath = reader.readStringOrNull(offsets[5]);
  object.name = reader.readString(offsets[6]);
  object.nameIgnorePrefix = reader.readStringOrNull(offsets[7]);
  object.seriesCount = reader.readLongOrNull(offsets[8]);
  object.updatedAt = reader.readLongOrNull(offsets[9]);
  return object;
}

P _authorEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongList(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _authorEntityGetId(AuthorEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _authorEntityGetLinks(AuthorEntity object) {
  return [];
}

void _authorEntityAttach(
    IsarCollection<dynamic> col, Id id, AuthorEntity object) {
  object.id = id;
}

extension AuthorEntityByIndex on IsarCollection<AuthorEntity> {
  Future<AuthorEntity?> getByAuthorId(String authorId) {
    return getByIndex(r'authorId', [authorId]);
  }

  AuthorEntity? getByAuthorIdSync(String authorId) {
    return getByIndexSync(r'authorId', [authorId]);
  }

  Future<bool> deleteByAuthorId(String authorId) {
    return deleteByIndex(r'authorId', [authorId]);
  }

  bool deleteByAuthorIdSync(String authorId) {
    return deleteByIndexSync(r'authorId', [authorId]);
  }

  Future<List<AuthorEntity?>> getAllByAuthorId(List<String> authorIdValues) {
    final values = authorIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'authorId', values);
  }

  List<AuthorEntity?> getAllByAuthorIdSync(List<String> authorIdValues) {
    final values = authorIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'authorId', values);
  }

  Future<int> deleteAllByAuthorId(List<String> authorIdValues) {
    final values = authorIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'authorId', values);
  }

  int deleteAllByAuthorIdSync(List<String> authorIdValues) {
    final values = authorIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'authorId', values);
  }

  Future<Id> putByAuthorId(AuthorEntity object) {
    return putByIndex(r'authorId', object);
  }

  Id putByAuthorIdSync(AuthorEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'authorId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAuthorId(List<AuthorEntity> objects) {
    return putAllByIndex(r'authorId', objects);
  }

  List<Id> putAllByAuthorIdSync(List<AuthorEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'authorId', objects, saveLinks: saveLinks);
  }
}

extension AuthorEntityQueryWhereSort
    on QueryBuilder<AuthorEntity, AuthorEntity, QWhere> {
  QueryBuilder<AuthorEntity, AuthorEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AuthorEntityQueryWhere
    on QueryBuilder<AuthorEntity, AuthorEntity, QWhereClause> {
  QueryBuilder<AuthorEntity, AuthorEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterWhereClause> authorIdEqualTo(
      String authorId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'authorId',
        value: [authorId],
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterWhereClause>
      authorIdNotEqualTo(String authorId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'authorId',
              lower: [],
              upper: [authorId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'authorId',
              lower: [authorId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'authorId',
              lower: [authorId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'authorId',
              lower: [],
              upper: [authorId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AuthorEntityQueryFilter
    on QueryBuilder<AuthorEntity, AuthorEntity, QFilterCondition> {
  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      addedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedAt',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      addedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedAt',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      addedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      addedAtGreaterThan(
    int? value, {
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

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      addedAtLessThan(
    int? value, {
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

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      addedAtBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      authorIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      authorIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      authorIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      authorIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      authorIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      authorIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      authorIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      authorIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      authorIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorId',
        value: '',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      authorIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorId',
        value: '',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      bookCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bookCount',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      bookCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bookCount',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      bookCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookCount',
        value: value,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      bookCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookCount',
        value: value,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      bookCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookCount',
        value: value,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      bookCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imageBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageBytes',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imageBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageBytes',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imageBytesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imageBytesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imageBytesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imageBytesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageBytes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imageBytesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imageBytesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imageBytesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imageBytesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imageBytesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imageBytesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imagePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIgnorePrefixIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameIgnorePrefix',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIgnorePrefixIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameIgnorePrefix',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIgnorePrefixEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameIgnorePrefix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIgnorePrefixGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameIgnorePrefix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIgnorePrefixLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameIgnorePrefix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIgnorePrefixBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameIgnorePrefix',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIgnorePrefixStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameIgnorePrefix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIgnorePrefixEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameIgnorePrefix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIgnorePrefixContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameIgnorePrefix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIgnorePrefixMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameIgnorePrefix',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIgnorePrefixIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameIgnorePrefix',
        value: '',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      nameIgnorePrefixIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameIgnorePrefix',
        value: '',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      seriesCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'seriesCount',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      seriesCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'seriesCount',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      seriesCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seriesCount',
        value: value,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      seriesCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seriesCount',
        value: value,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      seriesCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seriesCount',
        value: value,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      seriesCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seriesCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
      updatedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterFilterCondition>
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

extension AuthorEntityQueryObject
    on QueryBuilder<AuthorEntity, AuthorEntity, QFilterCondition> {}

extension AuthorEntityQueryLinks
    on QueryBuilder<AuthorEntity, AuthorEntity, QFilterCondition> {}

extension AuthorEntityQuerySortBy
    on QueryBuilder<AuthorEntity, AuthorEntity, QSortBy> {
  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByAddedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByAuthorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByAuthorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByBookCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookCount', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByBookCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookCount', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy>
      sortByNameIgnorePrefix() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameIgnorePrefix', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy>
      sortByNameIgnorePrefixDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameIgnorePrefix', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortBySeriesCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seriesCount', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy>
      sortBySeriesCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seriesCount', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension AuthorEntityQuerySortThenBy
    on QueryBuilder<AuthorEntity, AuthorEntity, QSortThenBy> {
  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByAddedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByAuthorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByAuthorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByBookCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookCount', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByBookCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookCount', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy>
      thenByNameIgnorePrefix() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameIgnorePrefix', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy>
      thenByNameIgnorePrefixDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameIgnorePrefix', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenBySeriesCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seriesCount', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy>
      thenBySeriesCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seriesCount', Sort.desc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension AuthorEntityQueryWhereDistinct
    on QueryBuilder<AuthorEntity, AuthorEntity, QDistinct> {
  QueryBuilder<AuthorEntity, AuthorEntity, QDistinct> distinctByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedAt');
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QDistinct> distinctByAuthorId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QDistinct> distinctByBookCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookCount');
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QDistinct> distinctByImageBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageBytes');
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QDistinct> distinctByImagePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QDistinct>
      distinctByNameIgnorePrefix({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameIgnorePrefix',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QDistinct> distinctBySeriesCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seriesCount');
    });
  }

  QueryBuilder<AuthorEntity, AuthorEntity, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension AuthorEntityQueryProperty
    on QueryBuilder<AuthorEntity, AuthorEntity, QQueryProperty> {
  QueryBuilder<AuthorEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AuthorEntity, int?, QQueryOperations> addedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedAt');
    });
  }

  QueryBuilder<AuthorEntity, String, QQueryOperations> authorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorId');
    });
  }

  QueryBuilder<AuthorEntity, int?, QQueryOperations> bookCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookCount');
    });
  }

  QueryBuilder<AuthorEntity, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<AuthorEntity, List<int>?, QQueryOperations>
      imageBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageBytes');
    });
  }

  QueryBuilder<AuthorEntity, String?, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<AuthorEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<AuthorEntity, String?, QQueryOperations>
      nameIgnorePrefixProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameIgnorePrefix');
    });
  }

  QueryBuilder<AuthorEntity, int?, QQueryOperations> seriesCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seriesCount');
    });
  }

  QueryBuilder<AuthorEntity, int?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
