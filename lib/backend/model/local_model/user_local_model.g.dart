// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_local_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserLocalModelCollection on Isar {
  IsarCollection<UserLocalModel> get userLocalModels => this.collection();
}

const UserLocalModelSchema = CollectionSchema(
  name: r'UserLocalModel',
  id: 1805101702450821015,
  properties: {
    r'hasSend': PropertySchema(
      id: 0,
      name: r'hasSend',
      type: IsarType.bool,
    ),
    r'notifiedTime': PropertySchema(
      id: 1,
      name: r'notifiedTime',
      type: IsarType.string,
    ),
    r'swipeCount': PropertySchema(
      id: 2,
      name: r'swipeCount',
      type: IsarType.long,
    )
  },
  estimateSize: _userLocalModelEstimateSize,
  serialize: _userLocalModelSerialize,
  deserialize: _userLocalModelDeserialize,
  deserializeProp: _userLocalModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userLocalModelGetId,
  getLinks: _userLocalModelGetLinks,
  attach: _userLocalModelAttach,
  version: '3.1.0+1',
);

int _userLocalModelEstimateSize(
  UserLocalModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.notifiedTime.length * 3;
  return bytesCount;
}

void _userLocalModelSerialize(
  UserLocalModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.hasSend);
  writer.writeString(offsets[1], object.notifiedTime);
  writer.writeLong(offsets[2], object.swipeCount);
}

UserLocalModel _userLocalModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserLocalModel();
  object.hasSend = reader.readBool(offsets[0]);
  object.id = id;
  object.notifiedTime = reader.readString(offsets[1]);
  object.swipeCount = reader.readLong(offsets[2]);
  return object;
}

P _userLocalModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userLocalModelGetId(UserLocalModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userLocalModelGetLinks(UserLocalModel object) {
  return [];
}

void _userLocalModelAttach(
    IsarCollection<dynamic> col, Id id, UserLocalModel object) {
  object.id = id;
}

extension UserLocalModelQueryWhereSort
    on QueryBuilder<UserLocalModel, UserLocalModel, QWhere> {
  QueryBuilder<UserLocalModel, UserLocalModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserLocalModelQueryWhere
    on QueryBuilder<UserLocalModel, UserLocalModel, QWhereClause> {
  QueryBuilder<UserLocalModel, UserLocalModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterWhereClause> idBetween(
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
}

extension UserLocalModelQueryFilter
    on QueryBuilder<UserLocalModel, UserLocalModel, QFilterCondition> {
  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      hasSendEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasSend',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
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

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
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

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      notifiedTimeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifiedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      notifiedTimeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notifiedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      notifiedTimeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notifiedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      notifiedTimeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notifiedTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      notifiedTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notifiedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      notifiedTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notifiedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      notifiedTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notifiedTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      notifiedTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notifiedTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      notifiedTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifiedTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      notifiedTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notifiedTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      swipeCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'swipeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      swipeCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'swipeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      swipeCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'swipeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterFilterCondition>
      swipeCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'swipeCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserLocalModelQueryObject
    on QueryBuilder<UserLocalModel, UserLocalModel, QFilterCondition> {}

extension UserLocalModelQueryLinks
    on QueryBuilder<UserLocalModel, UserLocalModel, QFilterCondition> {}

extension UserLocalModelQuerySortBy
    on QueryBuilder<UserLocalModel, UserLocalModel, QSortBy> {
  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy> sortByHasSend() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSend', Sort.asc);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy>
      sortByHasSendDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSend', Sort.desc);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy>
      sortByNotifiedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifiedTime', Sort.asc);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy>
      sortByNotifiedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifiedTime', Sort.desc);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy>
      sortBySwipeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'swipeCount', Sort.asc);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy>
      sortBySwipeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'swipeCount', Sort.desc);
    });
  }
}

extension UserLocalModelQuerySortThenBy
    on QueryBuilder<UserLocalModel, UserLocalModel, QSortThenBy> {
  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy> thenByHasSend() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSend', Sort.asc);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy>
      thenByHasSendDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSend', Sort.desc);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy>
      thenByNotifiedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifiedTime', Sort.asc);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy>
      thenByNotifiedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifiedTime', Sort.desc);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy>
      thenBySwipeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'swipeCount', Sort.asc);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QAfterSortBy>
      thenBySwipeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'swipeCount', Sort.desc);
    });
  }
}

extension UserLocalModelQueryWhereDistinct
    on QueryBuilder<UserLocalModel, UserLocalModel, QDistinct> {
  QueryBuilder<UserLocalModel, UserLocalModel, QDistinct> distinctByHasSend() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasSend');
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QDistinct>
      distinctByNotifiedTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifiedTime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserLocalModel, UserLocalModel, QDistinct>
      distinctBySwipeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'swipeCount');
    });
  }
}

extension UserLocalModelQueryProperty
    on QueryBuilder<UserLocalModel, UserLocalModel, QQueryProperty> {
  QueryBuilder<UserLocalModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserLocalModel, bool, QQueryOperations> hasSendProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasSend');
    });
  }

  QueryBuilder<UserLocalModel, String, QQueryOperations>
      notifiedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifiedTime');
    });
  }

  QueryBuilder<UserLocalModel, int, QQueryOperations> swipeCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'swipeCount');
    });
  }
}
