// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteUserModelImpl _$$RemoteUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RemoteUserModelImpl(
      id: json['id'] as int?,
      username: json['username'] as String?,
      musicStyle: json['musicStyle'] as String?,
      favoriteSongName: json['favoriteSongName'] as String?,
    );

Map<String, dynamic> _$$RemoteUserModelImplToJson(
        _$RemoteUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'musicStyle': instance.musicStyle,
      'favoriteSongName': instance.favoriteSongName,
    };
