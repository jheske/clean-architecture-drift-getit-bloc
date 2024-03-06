// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../playlist_with_songs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaylistWithSongsModel _$PlaylistWithSongsModelFromJson(
    Map<String, dynamic> json) {
  return _PlaylistWithSongsModel.fromJson(json);
}

/// @nodoc
mixin _$PlaylistWithSongsModel {
  int? get songId => throw _privateConstructorUsedError;
  int? get playlistId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaylistWithSongsModelCopyWith<PlaylistWithSongsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistWithSongsModelCopyWith<$Res> {
  factory $PlaylistWithSongsModelCopyWith(PlaylistWithSongsModel value,
          $Res Function(PlaylistWithSongsModel) then) =
      _$PlaylistWithSongsModelCopyWithImpl<$Res, PlaylistWithSongsModel>;
  @useResult
  $Res call({int? songId, int? playlistId});
}

/// @nodoc
class _$PlaylistWithSongsModelCopyWithImpl<$Res,
        $Val extends PlaylistWithSongsModel>
    implements $PlaylistWithSongsModelCopyWith<$Res> {
  _$PlaylistWithSongsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = freezed,
    Object? playlistId = freezed,
  }) {
    return _then(_value.copyWith(
      songId: freezed == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as int?,
      playlistId: freezed == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistWithSongsModelImplCopyWith<$Res>
    implements $PlaylistWithSongsModelCopyWith<$Res> {
  factory _$$PlaylistWithSongsModelImplCopyWith(
          _$PlaylistWithSongsModelImpl value,
          $Res Function(_$PlaylistWithSongsModelImpl) then) =
      __$$PlaylistWithSongsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? songId, int? playlistId});
}

/// @nodoc
class __$$PlaylistWithSongsModelImplCopyWithImpl<$Res>
    extends _$PlaylistWithSongsModelCopyWithImpl<$Res,
        _$PlaylistWithSongsModelImpl>
    implements _$$PlaylistWithSongsModelImplCopyWith<$Res> {
  __$$PlaylistWithSongsModelImplCopyWithImpl(
      _$PlaylistWithSongsModelImpl _value,
      $Res Function(_$PlaylistWithSongsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = freezed,
    Object? playlistId = freezed,
  }) {
    return _then(_$PlaylistWithSongsModelImpl(
      songId: freezed == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as int?,
      playlistId: freezed == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaylistWithSongsModelImpl extends _PlaylistWithSongsModel {
  const _$PlaylistWithSongsModelImpl({this.songId, this.playlistId})
      : super._();

  factory _$PlaylistWithSongsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistWithSongsModelImplFromJson(json);

  @override
  final int? songId;
  @override
  final int? playlistId;

  @override
  String toString() {
    return 'PlaylistWithSongsModel(songId: $songId, playlistId: $playlistId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistWithSongsModelImpl &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, songId, playlistId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistWithSongsModelImplCopyWith<_$PlaylistWithSongsModelImpl>
      get copyWith => __$$PlaylistWithSongsModelImplCopyWithImpl<
          _$PlaylistWithSongsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistWithSongsModelImplToJson(
      this,
    );
  }
}

abstract class _PlaylistWithSongsModel extends PlaylistWithSongsModel {
  const factory _PlaylistWithSongsModel(
      {final int? songId,
      final int? playlistId}) = _$PlaylistWithSongsModelImpl;
  const _PlaylistWithSongsModel._() : super._();

  factory _PlaylistWithSongsModel.fromJson(Map<String, dynamic> json) =
      _$PlaylistWithSongsModelImpl.fromJson;

  @override
  int? get songId;
  @override
  int? get playlistId;
  @override
  @JsonKey(ignore: true)
  _$$PlaylistWithSongsModelImplCopyWith<_$PlaylistWithSongsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
