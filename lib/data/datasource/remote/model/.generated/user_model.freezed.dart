// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _RemoteUserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get musicStyle => throw _privateConstructorUsedError;
  String? get favoriteSongName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int? id,
      String? username,
      String? musicStyle,
      String? favoriteSongName});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? musicStyle = freezed,
    Object? favoriteSongName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      musicStyle: freezed == musicStyle
          ? _value.musicStyle
          : musicStyle // ignore: cast_nullable_to_non_nullable
              as String?,
      favoriteSongName: freezed == favoriteSongName
          ? _value.favoriteSongName
          : favoriteSongName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteUserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$RemoteUserModelImplCopyWith(_$RemoteUserModelImpl value,
          $Res Function(_$RemoteUserModelImpl) then) =
      __$$RemoteUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? username,
      String? musicStyle,
      String? favoriteSongName});
}

/// @nodoc
class __$$RemoteUserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$RemoteUserModelImpl>
    implements _$$RemoteUserModelImplCopyWith<$Res> {
  __$$RemoteUserModelImplCopyWithImpl(
      _$RemoteUserModelImpl _value, $Res Function(_$RemoteUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? musicStyle = freezed,
    Object? favoriteSongName = freezed,
  }) {
    return _then(_$RemoteUserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      musicStyle: freezed == musicStyle
          ? _value.musicStyle
          : musicStyle // ignore: cast_nullable_to_non_nullable
              as String?,
      favoriteSongName: freezed == favoriteSongName
          ? _value.favoriteSongName
          : favoriteSongName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteUserModelImpl extends _RemoteUserModel {
  const _$RemoteUserModelImpl(
      {this.id, this.username, this.musicStyle, this.favoriteSongName})
      : super._();

  factory _$RemoteUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteUserModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? username;
  @override
  final String? musicStyle;
  @override
  final String? favoriteSongName;

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, musicStyle: $musicStyle, favoriteSongName: $favoriteSongName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.musicStyle, musicStyle) ||
                other.musicStyle == musicStyle) &&
            (identical(other.favoriteSongName, favoriteSongName) ||
                other.favoriteSongName == favoriteSongName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, musicStyle, favoriteSongName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteUserModelImplCopyWith<_$RemoteUserModelImpl> get copyWith =>
      __$$RemoteUserModelImplCopyWithImpl<_$RemoteUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteUserModelImplToJson(
      this,
    );
  }
}

abstract class _RemoteUserModel extends UserModel {
  const factory _RemoteUserModel(
      {final int? id,
      final String? username,
      final String? musicStyle,
      final String? favoriteSongName}) = _$RemoteUserModelImpl;
  const _RemoteUserModel._() : super._();

  factory _RemoteUserModel.fromJson(Map<String, dynamic> json) =
      _$RemoteUserModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get username;
  @override
  String? get musicStyle;
  @override
  String? get favoriteSongName;
  @override
  @JsonKey(ignore: true)
  _$$RemoteUserModelImplCopyWith<_$RemoteUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
