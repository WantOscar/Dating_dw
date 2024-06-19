// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_fan_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyFanMember _$MyFanMemberFromJson(Map<String, dynamic> json) {
  return _MyFanMember.fromJson(json);
}

/// @nodoc
mixin _$MyFanMember {
  int get id => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyFanMemberCopyWith<MyFanMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyFanMemberCopyWith<$Res> {
  factory $MyFanMemberCopyWith(
          MyFanMember value, $Res Function(MyFanMember) then) =
      _$MyFanMemberCopyWithImpl<$Res, MyFanMember>;
  @useResult
  $Res call({int id, String nickName, int age});
}

/// @nodoc
class _$MyFanMemberCopyWithImpl<$Res, $Val extends MyFanMember>
    implements $MyFanMemberCopyWith<$Res> {
  _$MyFanMemberCopyWithImpl(this._value, this._then);

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
abstract class _$$MyFanMemberImplCopyWith<$Res>
    implements $MyFanMemberCopyWith<$Res> {
  factory _$$MyFanMemberImplCopyWith(
          _$MyFanMemberImpl value, $Res Function(_$MyFanMemberImpl) then) =
      __$$MyFanMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String nickName, int age});
}

/// @nodoc
class __$$MyFanMemberImplCopyWithImpl<$Res>
    extends _$MyFanMemberCopyWithImpl<$Res, _$MyFanMemberImpl>
    implements _$$MyFanMemberImplCopyWith<$Res> {
  __$$MyFanMemberImplCopyWithImpl(
      _$MyFanMemberImpl _value, $Res Function(_$MyFanMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickName = null,
    Object? age = null,
  }) {
    return _then(_$MyFanMemberImpl(
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
class _$MyFanMemberImpl implements _MyFanMember {
  _$MyFanMemberImpl(
      {required this.id, required this.nickName, required this.age});

  factory _$MyFanMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyFanMemberImplFromJson(json);

  @override
  final int id;
  @override
  final String nickName;
  @override
  final int age;

  @override
  String toString() {
    return 'MyFanMember(id: $id, nickName: $nickName, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyFanMemberImpl &&
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
  _$$MyFanMemberImplCopyWith<_$MyFanMemberImpl> get copyWith =>
      __$$MyFanMemberImplCopyWithImpl<_$MyFanMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyFanMemberImplToJson(
      this,
    );
  }
}

abstract class _MyFanMember implements MyFanMember {
  factory _MyFanMember(
      {required final int id,
      required final String nickName,
      required final int age}) = _$MyFanMemberImpl;

  factory _MyFanMember.fromJson(Map<String, dynamic> json) =
      _$MyFanMemberImpl.fromJson;

  @override
  int get id;
  @override
  String get nickName;
  @override
  int get age;
  @override
  @JsonKey(ignore: true)
  _$$MyFanMemberImplCopyWith<_$MyFanMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
