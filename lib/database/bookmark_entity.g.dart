// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookmarkEntityCollection on Isar {
  IsarCollection<BookmarkEntity> get bookmarkEntitys => this.collection();
}

const BookmarkEntitySchema = CollectionSchema(
  name: r'BookmarkEntity',
  id: -7369956597930324689,
  properties: {
    r'bookmarkId': PropertySchema(
      id: 0,
      name: r'bookmarkId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.long,
    ),
    r'libraryItemId': PropertySchema(
      id: 2,
      name: r'libraryItemId',
      type: IsarType.string,
    ),
    r'note': PropertySchema(id: 3, name: r'note', type: IsarType.string),
    r'time': PropertySchema(id: 4, name: r'time', type: IsarType.long),
    r'title': PropertySchema(id: 5, name: r'title', type: IsarType.string),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.long,
    ),
  },

  estimateSize: _bookmarkEntityEstimateSize,
  serialize: _bookmarkEntitySerialize,
  deserialize: _bookmarkEntityDeserialize,
  deserializeProp: _bookmarkEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'bookmarkId': IndexSchema(
      id: 7502005763379596484,
      name: r'bookmarkId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bookmarkId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _bookmarkEntityGetId,
  getLinks: _bookmarkEntityGetLinks,
  attach: _bookmarkEntityAttach,
  version: '3.3.0-dev.3',
);

int _bookmarkEntityEstimateSize(
  BookmarkEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookmarkId.length * 3;
  bytesCount += 3 + object.libraryItemId.length * 3;
  {
    final value = object.note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _bookmarkEntitySerialize(
  BookmarkEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookmarkId);
  writer.writeLong(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.libraryItemId);
  writer.writeString(offsets[3], object.note);
  writer.writeLong(offsets[4], object.time);
  writer.writeString(offsets[5], object.title);
  writer.writeLong(offsets[6], object.updatedAt);
}

BookmarkEntity _bookmarkEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookmarkEntity();
  object.bookmarkId = reader.readString(offsets[0]);
  object.createdAt = reader.readLong(offsets[1]);
  object.id = id;
  object.libraryItemId = reader.readString(offsets[2]);
  object.note = reader.readStringOrNull(offsets[3]);
  object.time = reader.readLong(offsets[4]);
  object.title = reader.readString(offsets[5]);
  object.updatedAt = reader.readLong(offsets[6]);
  return object;
}

P _bookmarkEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookmarkEntityGetId(BookmarkEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookmarkEntityGetLinks(BookmarkEntity object) {
  return [];
}

void _bookmarkEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  BookmarkEntity object,
) {
  object.id = id;
}

extension BookmarkEntityByIndex on IsarCollection<BookmarkEntity> {
  Future<BookmarkEntity?> getByBookmarkId(String bookmarkId) {
    return getByIndex(r'bookmarkId', [bookmarkId]);
  }

  BookmarkEntity? getByBookmarkIdSync(String bookmarkId) {
    return getByIndexSync(r'bookmarkId', [bookmarkId]);
  }

  Future<bool> deleteByBookmarkId(String bookmarkId) {
    return deleteByIndex(r'bookmarkId', [bookmarkId]);
  }

  bool deleteByBookmarkIdSync(String bookmarkId) {
    return deleteByIndexSync(r'bookmarkId', [bookmarkId]);
  }

  Future<List<BookmarkEntity?>> getAllByBookmarkId(
    List<String> bookmarkIdValues,
  ) {
    final values = bookmarkIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'bookmarkId', values);
  }

  List<BookmarkEntity?> getAllByBookmarkIdSync(List<String> bookmarkIdValues) {
    final values = bookmarkIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'bookmarkId', values);
  }

  Future<int> deleteAllByBookmarkId(List<String> bookmarkIdValues) {
    final values = bookmarkIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'bookmarkId', values);
  }

  int deleteAllByBookmarkIdSync(List<String> bookmarkIdValues) {
    final values = bookmarkIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'bookmarkId', values);
  }

  Future<Id> putByBookmarkId(BookmarkEntity object) {
    return putByIndex(r'bookmarkId', object);
  }

  Id putByBookmarkIdSync(BookmarkEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'bookmarkId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBookmarkId(List<BookmarkEntity> objects) {
    return putAllByIndex(r'bookmarkId', objects);
  }

  List<Id> putAllByBookmarkIdSync(
    List<BookmarkEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'bookmarkId', objects, saveLinks: saveLinks);
  }
}

extension BookmarkEntityQueryWhereSort
    on QueryBuilder<BookmarkEntity, BookmarkEntity, QWhere> {
  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BookmarkEntityQueryWhere
    on QueryBuilder<BookmarkEntity, BookmarkEntity, QWhereClause> {
  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterWhereClause>
  bookmarkIdEqualTo(String bookmarkId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookmarkId', value: [bookmarkId]),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterWhereClause>
  bookmarkIdNotEqualTo(String bookmarkId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookmarkId',
                lower: [],
                upper: [bookmarkId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookmarkId',
                lower: [bookmarkId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookmarkId',
                lower: [bookmarkId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookmarkId',
                lower: [],
                upper: [bookmarkId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension BookmarkEntityQueryFilter
    on QueryBuilder<BookmarkEntity, BookmarkEntity, QFilterCondition> {
  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  bookmarkIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'bookmarkId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  bookmarkIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bookmarkId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  bookmarkIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bookmarkId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  bookmarkIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bookmarkId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  bookmarkIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'bookmarkId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  bookmarkIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'bookmarkId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  bookmarkIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'bookmarkId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  bookmarkIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'bookmarkId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  bookmarkIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bookmarkId', value: ''),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  bookmarkIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'bookmarkId', value: ''),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  createdAtEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  createdAtGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  createdAtLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  createdAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  libraryItemIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'libraryItemId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  libraryItemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'libraryItemId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  libraryItemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'libraryItemId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  libraryItemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'libraryItemId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  libraryItemIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'libraryItemId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  libraryItemIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'libraryItemId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  libraryItemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'libraryItemId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  libraryItemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'libraryItemId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  libraryItemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'libraryItemId', value: ''),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  libraryItemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'libraryItemId', value: ''),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'note'),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'note'),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  noteEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  noteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  noteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  noteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'note',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  noteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  noteEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'note',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  timeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'time', value: value),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  timeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'time',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  timeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'time',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  timeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'time',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  titleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  titleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  titleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  updatedAtEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  updatedAtGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  updatedAtLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterFilterCondition>
  updatedAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension BookmarkEntityQueryObject
    on QueryBuilder<BookmarkEntity, BookmarkEntity, QFilterCondition> {}

extension BookmarkEntityQueryLinks
    on QueryBuilder<BookmarkEntity, BookmarkEntity, QFilterCondition> {}

extension BookmarkEntityQuerySortBy
    on QueryBuilder<BookmarkEntity, BookmarkEntity, QSortBy> {
  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy>
  sortByBookmarkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookmarkId', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy>
  sortByBookmarkIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookmarkId', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy>
  sortByLibraryItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryItemId', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy>
  sortByLibraryItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryItemId', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BookmarkEntityQuerySortThenBy
    on QueryBuilder<BookmarkEntity, BookmarkEntity, QSortThenBy> {
  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy>
  thenByBookmarkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookmarkId', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy>
  thenByBookmarkIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookmarkId', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy>
  thenByLibraryItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryItemId', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy>
  thenByLibraryItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'libraryItemId', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BookmarkEntityQueryWhereDistinct
    on QueryBuilder<BookmarkEntity, BookmarkEntity, QDistinct> {
  QueryBuilder<BookmarkEntity, BookmarkEntity, QDistinct> distinctByBookmarkId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookmarkId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QDistinct>
  distinctByLibraryItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'libraryItemId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QDistinct> distinctByNote({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookmarkEntity, BookmarkEntity, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BookmarkEntityQueryProperty
    on QueryBuilder<BookmarkEntity, BookmarkEntity, QQueryProperty> {
  QueryBuilder<BookmarkEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookmarkEntity, String, QQueryOperations> bookmarkIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookmarkId');
    });
  }

  QueryBuilder<BookmarkEntity, int, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BookmarkEntity, String, QQueryOperations>
  libraryItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'libraryItemId');
    });
  }

  QueryBuilder<BookmarkEntity, String?, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<BookmarkEntity, int, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<BookmarkEntity, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<BookmarkEntity, int, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
