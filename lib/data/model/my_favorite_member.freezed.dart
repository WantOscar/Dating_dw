// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_favorite_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyFavoriteMember _$MyFavoriteMemberFromJson(Map<String, dynamic> json) {
  return _MyFavoriteMember.fromJson(json);
}

/// @nodoc
mixin _$MyFavoriteMember {
  int get id => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyFavoriteMemberCopyWith<MyFavoriteMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyFavoriteMemberCopyWith<$Res> {
  factory $MyFavoriteMemberCopyWith(
          MyFavoriteMember value, $Res Function(MyFavoriteMember) then) =
      _$MyFavoriteMemberCopyWithImpl<$Res, MyFavoriteMember>;
  @useResult
  $Res call({int id, String nickName, int age});
}

/// @nodoc
class _$MyFavoriteMemberCopyWithImpl<$Res, $Val extends MyFavoriteMember>
    implements $MyFavoriteMemberCopyWith<$Res> {
  _$MyFavoriteMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickName = null,
    Object? age = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyFavoriteMemberImplCopyWith<$Res>
    implements $MyFavoriteMemberCopyWith<$Res> {
  factory _$$MyFavoriteMemberImplCopyWith(_$MyFavoriteMemberImpl value,
          $Res Function(_$MyFavoriteMemberImpl) then) =
      __$$MyFavoriteMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String nickName, int age});
}

/// @nodoc
class __$$MyFavoriteMemberImplCopyWithImpl<$Res>
    extends _$MyFavoriteMemberCopyWithImpl<$Res, _$MyFavoriteMemberImpl>
    implements _$$MyFavoriteMemberImplCopyWith<$Res> {
  __$$MyFavoriteMemberImplCopyWithImpl(_$MyFavoriteMemberImpl _value,
      $Res Function(_$MyFavoriteMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickName = null,
    Object? age = null,
  }) {
    return _then(_$MyFavoriteMemberImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyFavoriteMemberImpl implements _MyFavoriteMember {
  _$MyFavoriteMemberImpl(
      {required this.id, required this.nickName, required this.age});

  factory _$MyFavoriteMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyFavoriteMemberImplFromJson(json);

  @override
  final int id;
  @override
  final String nickName;
  @override
  final int age;

  @override
  String toString() {
    return 'MyFavoriteMember(id: $id, nickName: $nickName, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyFavoriteMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nickName, age);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyFavoriteMemberImplCopyWith<_$MyFavoriteMemberImpl> get copyWith =>
      __$$MyFavoriteMemberImplCopyWithImpl<_$MyFavoriteMemberImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyFavoriteMemberImplToJson(
      this,
    );
  }
}

abstract class _MyFavoriteMember implements MyFavoriteMember {
  factory _MyFavoriteMember(
      {required final int id,
      required final String nickName,
      required final int age}) = _$MyFavoriteMemberImpl;

  factory _MyFavoriteMember.fromJson(Map<String, dynamic> json) =
      _$MyFavoriteMemberImpl.fromJson;

  @override
  int get id;
  @override
  String get nickName;
  @override
  int get age;
  @override
  @JsonKey(ignore: true)
  _$$MyFavoriteMemberImplCopyWith<_$MyFavoriteMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
