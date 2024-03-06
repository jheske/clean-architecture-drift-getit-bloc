// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteUserModelImpl _$$RemoteUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RemoteUserModelImpl(
      username: json['username'] as String?,
      musicStyle: json['music_style'] as String?,
      favoriteSongName: json['favorite_song_name'] as String?,
      playlist: json['playlist'] == null
          ? null
          : PlaylistModel.fromJson(json['playlist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RemoteUserModelImplToJson(
        _$RemoteUserModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'music_style': instance.musicStyle,
      'favorite_song_name': instance.favoriteSongName,
      'playlist': instance.playlist,
    };
