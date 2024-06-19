// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecommendMember _$RecommendMemberFromJson(Map<String, dynamic> json) {
  return _RecommendMember.fromJson(json);
}

/// @nodoc
mixin _$RecommendMember {
  int get id => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendMemberCopyWith<RecommendMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendMemberCopyWith<$Res> {
  factory $RecommendMemberCopyWith(
          RecommendMember value, $Res Function(RecommendMember) then) =
      _$RecommendMemberCopyWithImpl<$Res, RecommendMember>;
  @useResult
  $Res call(
      {int id,
      String nickName,
      String address,
      int age,
      int height,
      String image});
}

/// @nodoc
class _$RecommendMemberCopyWithImpl<$Res, $Val extends RecommendMember>
    implements $RecommendMemberCopyWith<$Res> {
  _$RecommendMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickName = null,
    Object? address = null,
    Object? age = null,
    Object? height = null,
    Object? image = null,
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
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendMemberImplCopyWith<$Res>
    implements $RecommendMemberCopyWith<$Res> {
  factory _$$RecommendMemberImplCopyWith(_$RecommendMemberImpl value,
          $Res Function(_$RecommendMemberImpl) then) =
      __$$RecommendMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nickName,
      String address,
      int age,
      int height,
      String image});
}

/// @nodoc
class __$$RecommendMemberImplCopyWithImpl<$Res>
    extends _$RecommendMemberCopyWithImpl<$Res, _$RecommendMemberImpl>
    implements _$$RecommendMemberImplCopyWith<$Res> {
  __$$RecommendMemberImplCopyWithImpl(
      _$RecommendMemberImpl _value, $Res Function(_$RecommendMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickName = null,
    Object? address = null,
    Object? age = null,
    Object? height = null,
    Object? image = null,
  }) {
    return _then(_$RecommendMemberImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendMemberImpl implements _RecommendMember {
  _$RecommendMemberImpl(
      {required this.id,
      required this.nickName,
      required this.address,
      required this.age,
      required this.height,
      required this.image});

  factory _$RecommendMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendMemberImplFromJson(json);

  @override
  final int id;
  @override
  final String nickName;
  @override
  final String address;
  @override
  final int age;
  @override
  final int height;
  @override
  final String image;

  @override
  String toString() {
    return 'RecommendMember(id: $id, nickName: $nickName, address: $address, age: $age, height: $height, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nickName, address, age, height, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendMemberImplCopyWith<_$RecommendMemberImpl> get copyWith =>
      __$$RecommendMemberImplCopyWithImpl<_$RecommendMemberImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendMemberImplToJson(
      this,
    );
  }
}

abstract class _RecommendMember implements RecommendMember {
  factory _RecommendMember(
      {required final int id,
      required final String nickName,
      required final String address,
      required final int age,
      required final int height,
      required final String image}) = _$RecommendMemberImpl;

  factory _RecommendMember.fromJson(Map<String, dynamic> json) =
      _$RecommendMemberImpl.fromJson;

  @override
  int get id;
  @override
  String get nickName;
  @override
  String get address;
  @override
  int get age;
  @override
  int get height;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$RecommendMemberImplCopyWith<_$RecommendMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
