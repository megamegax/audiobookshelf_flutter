// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_item_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSeriesItemEntityCollection on Isar {
  IsarCollection<SeriesItemEntity> get seriesItemEntitys => this.collection();
}

const SeriesItemEntitySchema = CollectionSchema(
  name: r'SeriesItemEntity',
  id: 852468736982220442,
  properties: {
    r'addedAt': PropertySchema(
      id: 0,
      name: r'addedAt',
      type: IsarType.long,
    ),
    r'books': PropertySchema(
      id: 1,
      name: r'books',
      type: IsarType.stringList,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'nameIgnorePrefix': PropertySchema(
      id: 4,
      name: r'nameIgnorePrefix',
      type: IsarType.string,
    ),
    r'seriesId': PropertySchema(
      id: 5,
      name: r'seriesId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.long,
    )
  },
  estimateSize: _seriesItemEntityEstimateSize,
  serialize: _seriesItemEntitySerialize,
  deserialize: _seriesItemEntityDeserialize,
  deserializeProp: _seriesItemEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'seriesId': IndexSchema(
      id: -6366517829284187702,
      name: r'seriesId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'seriesId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _seriesItemEntityGetId,
  getLinks: _seriesItemEntityGetLinks,
  attach: _seriesItemEntityAttach,
  version: '3.1.0+1',
);

int _seriesItemEntityEstimateSize(
  SeriesItemEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.books.length * 3;
  {
    for (var i = 0; i < object.books.length; i++) {
      final value = object.books[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.nameIgnorePrefix.length * 3;
  {
    final value = object.seriesId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _seriesItemEntitySerialize(
  SeriesItemEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.addedAt);
  writer.writeStringList(offsets[1], object.books);
  writer.writeString(offsets[2], object.description);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.nameIgnorePrefix);
  writer.writeString(offsets[5], object.seriesId);
  writer.writeLong(offsets[6], object.updatedAt);
}

SeriesItemEntity _seriesItemEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SeriesItemEntity(
    addedAt: reader.readLong(offsets[0]),
    books: reader.readStringList(offsets[1]) ?? [],
    description: reader.readStringOrNull(offsets[2]),
    name: reader.readString(offsets[3]),
    nameIgnorePrefix: reader.readString(offsets[4]),
    seriesId: reader.readStringOrNull(offsets[5]),
    updatedAt: reader.readLongOrNull(offsets[6]),
  );
  object.id = id;
  return object;
}

P _seriesItemEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _seriesItemEntityGetId(SeriesItemEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _seriesItemEntityGetLinks(SeriesItemEntity object) {
  return [];
}

void _seriesItemEntityAttach(
    IsarCollection<dynamic> col, Id id, SeriesItemEntity object) {
  object.id = id;
}

extension SeriesItemEntityQueryWhereSort
    on QueryBuilder<SeriesItemEntity, SeriesItemEntity, QWhere> {
  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SeriesItemEntityQueryWhere
    on QueryBuilder<SeriesItemEntity, SeriesItemEntity, QWhereClause> {
  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterWhereClause>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterWhereClause>
      seriesIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'seriesId',
        value: [null],
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterWhereClause>
      seriesIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'seriesId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterWhereClause>
      seriesIdEqualTo(String? seriesId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'seriesId',
        value: [seriesId],
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterWhereClause>
      seriesIdNotEqualTo(String? seriesId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'seriesId',
              lower: [],
              upper: [seriesId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'seriesId',
              lower: [seriesId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'seriesId',
              lower: [seriesId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'seriesId',
              lower: [],
              upper: [seriesId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SeriesItemEntityQueryFilter
    on QueryBuilder<SeriesItemEntity, SeriesItemEntity, QFilterCondition> {
  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      addedAtEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'books',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'books',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'books',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'books',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'books',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'books',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'books',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'books',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'books',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'books',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'books',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'books',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'books',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'books',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'books',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      booksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'books',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameIgnorePrefixEqualTo(
    String value, {
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameIgnorePrefixGreaterThan(
    String value, {
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameIgnorePrefixLessThan(
    String value, {
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameIgnorePrefixBetween(
    String lower,
    String upper, {
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameIgnorePrefixContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameIgnorePrefix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameIgnorePrefixMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameIgnorePrefix',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameIgnorePrefixIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameIgnorePrefix',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      nameIgnorePrefixIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameIgnorePrefix',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      seriesIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'seriesId',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      seriesIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'seriesId',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      seriesIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      seriesIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      seriesIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      seriesIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seriesId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      seriesIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'seriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      seriesIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'seriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      seriesIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'seriesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      seriesIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'seriesId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      seriesIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seriesId',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      seriesIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'seriesId',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
      updatedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterFilterCondition>
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

extension SeriesItemEntityQueryObject
    on QueryBuilder<SeriesItemEntity, SeriesItemEntity, QFilterCondition> {}

extension SeriesItemEntityQueryLinks
    on QueryBuilder<SeriesItemEntity, SeriesItemEntity, QFilterCondition> {}

extension SeriesItemEntityQuerySortBy
    on QueryBuilder<SeriesItemEntity, SeriesItemEntity, QSortBy> {
  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      sortByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      sortByAddedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.desc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      sortByNameIgnorePrefix() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameIgnorePrefix', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      sortByNameIgnorePrefixDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameIgnorePrefix', Sort.desc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      sortBySeriesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seriesId', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      sortBySeriesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seriesId', Sort.desc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SeriesItemEntityQuerySortThenBy
    on QueryBuilder<SeriesItemEntity, SeriesItemEntity, QSortThenBy> {
  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      thenByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      thenByAddedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.desc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      thenByNameIgnorePrefix() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameIgnorePrefix', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      thenByNameIgnorePrefixDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameIgnorePrefix', Sort.desc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      thenBySeriesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seriesId', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      thenBySeriesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seriesId', Sort.desc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SeriesItemEntityQueryWhereDistinct
    on QueryBuilder<SeriesItemEntity, SeriesItemEntity, QDistinct> {
  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QDistinct>
      distinctByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedAt');
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QDistinct>
      distinctByBooks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'books');
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QDistinct>
      distinctByNameIgnorePrefix({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameIgnorePrefix',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QDistinct>
      distinctBySeriesId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seriesId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesItemEntity, SeriesItemEntity, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension SeriesItemEntityQueryProperty
    on QueryBuilder<SeriesItemEntity, SeriesItemEntity, QQueryProperty> {
  QueryBuilder<SeriesItemEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SeriesItemEntity, int, QQueryOperations> addedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedAt');
    });
  }

  QueryBuilder<SeriesItemEntity, List<String>, QQueryOperations>
      booksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'books');
    });
  }

  QueryBuilder<SeriesItemEntity, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<SeriesItemEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SeriesItemEntity, String, QQueryOperations>
      nameIgnorePrefixProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameIgnorePrefix');
    });
  }

  QueryBuilder<SeriesItemEntity, String?, QQueryOperations> seriesIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seriesId');
    });
  }

  QueryBuilder<SeriesItemEntity, int?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
