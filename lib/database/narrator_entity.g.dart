// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'narrator_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNarratorEntityCollection on Isar {
  IsarCollection<NarratorEntity> get narratorEntitys => this.collection();
}

const NarratorEntitySchema = CollectionSchema(
  name: r'NarratorEntity',
  id: 4405718430328842777,
  properties: {
    r'addedAt': PropertySchema(id: 0, name: r'addedAt', type: IsarType.long),
    r'bookCount': PropertySchema(
      id: 1,
      name: r'bookCount',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'imageBytes': PropertySchema(
      id: 3,
      name: r'imageBytes',
      type: IsarType.longList,
    ),
    r'imagePath': PropertySchema(
      id: 4,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'name': PropertySchema(id: 5, name: r'name', type: IsarType.string),
    r'nameIgnorePrefix': PropertySchema(
      id: 6,
      name: r'nameIgnorePrefix',
      type: IsarType.string,
    ),
    r'narratorId': PropertySchema(
      id: 7,
      name: r'narratorId',
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
    ),
  },

  estimateSize: _narratorEntityEstimateSize,
  serialize: _narratorEntitySerialize,
  deserialize: _narratorEntityDeserialize,
  deserializeProp: _narratorEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'narratorId': IndexSchema(
      id: 4718493619967506239,
      name: r'narratorId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'narratorId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _narratorEntityGetId,
  getLinks: _narratorEntityGetLinks,
  attach: _narratorEntityAttach,
  version: '3.3.0-dev.3',
);

int _narratorEntityEstimateSize(
  NarratorEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
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
  bytesCount += 3 + object.narratorId.length * 3;
  return bytesCount;
}

void _narratorEntitySerialize(
  NarratorEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.addedAt);
  writer.writeLong(offsets[1], object.bookCount);
  writer.writeString(offsets[2], object.description);
  writer.writeLongList(offsets[3], object.imageBytes);
  writer.writeString(offsets[4], object.imagePath);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.nameIgnorePrefix);
  writer.writeString(offsets[7], object.narratorId);
  writer.writeLong(offsets[8], object.seriesCount);
  writer.writeLong(offsets[9], object.updatedAt);
}

NarratorEntity _narratorEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NarratorEntity();
  object.addedAt = reader.readLongOrNull(offsets[0]);
  object.bookCount = reader.readLongOrNull(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.imageBytes = reader.readLongList(offsets[3]);
  object.imagePath = reader.readStringOrNull(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.nameIgnorePrefix = reader.readStringOrNull(offsets[6]);
  object.narratorId = reader.readString(offsets[7]);
  object.seriesCount = reader.readLongOrNull(offsets[8]);
  object.updatedAt = reader.readLongOrNull(offsets[9]);
  return object;
}

P _narratorEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongList(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _narratorEntityGetId(NarratorEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _narratorEntityGetLinks(NarratorEntity object) {
  return [];
}

void _narratorEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  NarratorEntity object,
) {
  object.id = id;
}

extension NarratorEntityByIndex on IsarCollection<NarratorEntity> {
  Future<NarratorEntity?> getByNarratorId(String narratorId) {
    return getByIndex(r'narratorId', [narratorId]);
  }

  NarratorEntity? getByNarratorIdSync(String narratorId) {
    return getByIndexSync(r'narratorId', [narratorId]);
  }

  Future<bool> deleteByNarratorId(String narratorId) {
    return deleteByIndex(r'narratorId', [narratorId]);
  }

  bool deleteByNarratorIdSync(String narratorId) {
    return deleteByIndexSync(r'narratorId', [narratorId]);
  }

  Future<List<NarratorEntity?>> getAllByNarratorId(
    List<String> narratorIdValues,
  ) {
    final values = narratorIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'narratorId', values);
  }

  List<NarratorEntity?> getAllByNarratorIdSync(List<String> narratorIdValues) {
    final values = narratorIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'narratorId', values);
  }

  Future<int> deleteAllByNarratorId(List<String> narratorIdValues) {
    final values = narratorIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'narratorId', values);
  }

  int deleteAllByNarratorIdSync(List<String> narratorIdValues) {
    final values = narratorIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'narratorId', values);
  }

  Future<Id> putByNarratorId(NarratorEntity object) {
    return putByIndex(r'narratorId', object);
  }

  Id putByNarratorIdSync(NarratorEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'narratorId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByNarratorId(List<NarratorEntity> objects) {
    return putAllByIndex(r'narratorId', objects);
  }

  List<Id> putAllByNarratorIdSync(
    List<NarratorEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'narratorId', objects, saveLinks: saveLinks);
  }
}

extension NarratorEntityQueryWhereSort
    on QueryBuilder<NarratorEntity, NarratorEntity, QWhere> {
  QueryBuilder<NarratorEntity, NarratorEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NarratorEntityQueryWhere
    on QueryBuilder<NarratorEntity, NarratorEntity, QWhereClause> {
  QueryBuilder<NarratorEntity, NarratorEntity, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterWhereClause>
  narratorIdEqualTo(String narratorId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'narratorId', value: [narratorId]),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterWhereClause>
  narratorIdNotEqualTo(String narratorId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'narratorId',
                lower: [],
                upper: [narratorId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'narratorId',
                lower: [narratorId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'narratorId',
                lower: [narratorId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'narratorId',
                lower: [],
                upper: [narratorId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension NarratorEntityQueryFilter
    on QueryBuilder<NarratorEntity, NarratorEntity, QFilterCondition> {
  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  addedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'addedAt'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  addedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'addedAt'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  addedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'addedAt', value: value),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  addedAtGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'addedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  addedAtLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'addedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  addedAtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'addedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  bookCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'bookCount'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  bookCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'bookCount'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  bookCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bookCount', value: value),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  bookCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bookCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  bookCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bookCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  bookCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bookCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  descriptionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
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

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
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

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imageBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'imageBytes'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imageBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'imageBytes'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imageBytesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'imageBytes', value: value),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imageBytesElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'imageBytes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imageBytesElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'imageBytes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imageBytesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'imageBytes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imageBytesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imageBytes', length, true, length, true);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imageBytesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imageBytes', 0, true, 0, true);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imageBytesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imageBytes', 0, false, 999999, true);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imageBytesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imageBytes', 0, true, length, include);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imageBytesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imageBytes', length, include, 999999, true);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
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

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'imagePath'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'imagePath'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imagePathEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'imagePath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imagePathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imagePathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'imagePath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'imagePath', value: ''),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'imagePath', value: ''),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIgnorePrefixIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nameIgnorePrefix'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIgnorePrefixIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nameIgnorePrefix'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIgnorePrefixEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nameIgnorePrefix',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIgnorePrefixGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nameIgnorePrefix',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIgnorePrefixLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nameIgnorePrefix',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIgnorePrefixBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nameIgnorePrefix',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIgnorePrefixStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nameIgnorePrefix',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIgnorePrefixEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nameIgnorePrefix',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIgnorePrefixContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nameIgnorePrefix',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIgnorePrefixMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nameIgnorePrefix',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIgnorePrefixIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nameIgnorePrefix', value: ''),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  nameIgnorePrefixIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nameIgnorePrefix', value: ''),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  narratorIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'narratorId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  narratorIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'narratorId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  narratorIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'narratorId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  narratorIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'narratorId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  narratorIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'narratorId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  narratorIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'narratorId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  narratorIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'narratorId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  narratorIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'narratorId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  narratorIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'narratorId', value: ''),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  narratorIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'narratorId', value: ''),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  seriesCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'seriesCount'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  seriesCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'seriesCount'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  seriesCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'seriesCount', value: value),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  seriesCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'seriesCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  seriesCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'seriesCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  seriesCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'seriesCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  updatedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  updatedAtGreaterThan(int? value, {bool include = false}) {
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

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  updatedAtLessThan(int? value, {bool include = false}) {
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

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterFilterCondition>
  updatedAtBetween(
    int? lower,
    int? upper, {
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

extension NarratorEntityQueryObject
    on QueryBuilder<NarratorEntity, NarratorEntity, QFilterCondition> {}

extension NarratorEntityQueryLinks
    on QueryBuilder<NarratorEntity, NarratorEntity, QFilterCondition> {}

extension NarratorEntityQuerySortBy
    on QueryBuilder<NarratorEntity, NarratorEntity, QSortBy> {
  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> sortByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  sortByAddedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> sortByBookCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookCount', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  sortByBookCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookCount', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  sortByNameIgnorePrefix() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameIgnorePrefix', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  sortByNameIgnorePrefixDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameIgnorePrefix', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  sortByNarratorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'narratorId', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  sortByNarratorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'narratorId', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  sortBySeriesCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seriesCount', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  sortBySeriesCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seriesCount', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension NarratorEntityQuerySortThenBy
    on QueryBuilder<NarratorEntity, NarratorEntity, QSortThenBy> {
  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> thenByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  thenByAddedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedAt', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> thenByBookCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookCount', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  thenByBookCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookCount', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  thenByNameIgnorePrefix() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameIgnorePrefix', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  thenByNameIgnorePrefixDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameIgnorePrefix', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  thenByNarratorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'narratorId', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  thenByNarratorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'narratorId', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  thenBySeriesCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seriesCount', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  thenBySeriesCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seriesCount', Sort.desc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension NarratorEntityQueryWhereDistinct
    on QueryBuilder<NarratorEntity, NarratorEntity, QDistinct> {
  QueryBuilder<NarratorEntity, NarratorEntity, QDistinct> distinctByAddedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedAt');
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QDistinct>
  distinctByBookCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookCount');
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QDistinct>
  distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QDistinct>
  distinctByImageBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageBytes');
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QDistinct> distinctByImagePath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QDistinct>
  distinctByNameIgnorePrefix({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'nameIgnorePrefix',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QDistinct> distinctByNarratorId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'narratorId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QDistinct>
  distinctBySeriesCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seriesCount');
    });
  }

  QueryBuilder<NarratorEntity, NarratorEntity, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension NarratorEntityQueryProperty
    on QueryBuilder<NarratorEntity, NarratorEntity, QQueryProperty> {
  QueryBuilder<NarratorEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NarratorEntity, int?, QQueryOperations> addedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedAt');
    });
  }

  QueryBuilder<NarratorEntity, int?, QQueryOperations> bookCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookCount');
    });
  }

  QueryBuilder<NarratorEntity, String?, QQueryOperations>
  descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<NarratorEntity, List<int>?, QQueryOperations>
  imageBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageBytes');
    });
  }

  QueryBuilder<NarratorEntity, String?, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<NarratorEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<NarratorEntity, String?, QQueryOperations>
  nameIgnorePrefixProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameIgnorePrefix');
    });
  }

  QueryBuilder<NarratorEntity, String, QQueryOperations> narratorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'narratorId');
    });
  }

  QueryBuilder<NarratorEntity, int?, QQueryOperations> seriesCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seriesCount');
    });
  }

  QueryBuilder<NarratorEntity, int?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
