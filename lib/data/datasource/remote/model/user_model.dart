// ignore_for_file: invalid_annotation_target

/// Copyright (C) 2024 Jill Heske
/// This file is part of flutter-clean-architecture-drift-retrofit.
///
/// flutter-clean-architecture-drift-retrofit is free software: you can redistribute it and/or modify
/// it under the terms of the Apache License, Version 2.0, as published by
/// the Apache Software Foundation.
///
/// flutter-clean-architecture-drift-retrofit is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
/// Apache License, Version 2.0 for more details.
///
/// You should have received a copy of the Apache License, Version 2.0
/// along with flutter-clean-architecture-drift-retrofit. If not, see <https:///www.apache.org/licenses/LICENSE-2.0>.
import 'package:clean_architecture_drift_getit_bloc/data/datasource/remote/model/playlist_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '.generated/user_model.freezed.dart';
part '.generated/user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? username,
    @JsonKey(name: 'music_style') String? musicStyle,
    @JsonKey(name: 'favorite_song_name') String? favoriteSongName,
    PlaylistModel? playlist,
  }) = _RemoteUserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  static Future<List<UserModel>> fromJsonArray(List jsonArray) async {
    return jsonArray.map((value) => UserModel.fromJson(value)).toList();
  }
}
