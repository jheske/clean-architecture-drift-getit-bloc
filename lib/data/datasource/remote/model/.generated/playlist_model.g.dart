// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaylistModelImpl _$$PlaylistModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaylistModelImpl(
      name: json['name'] as String?,
      songs: (json['songs'] as List<dynamic>?)?.map((e) => e as int?).toList(),
    );

Map<String, dynamic> _$$PlaylistModelImplToJson(_$PlaylistModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'songs': instance.songs,
    };
