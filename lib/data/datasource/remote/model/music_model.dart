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
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entity/model_typedefs.dart';

part '.generated/music_model.freezed.dart';

@freezed
class MusicModel with _$MusicModel {
  const factory MusicModel({
    @JsonKey(name: 'Users') required List<UserModel> users,
    //  @JsonKey(name: 'Songs') required List<SongModel> songs,
    @JsonKey(name: 'Artists') required List<ArtistModel> artists,
  }) = _MusicModel;

  factory MusicModel.init() => const MusicModel(
        users: [],
        artists: [],
      );

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    // Extract the list of user JSON objects
    final List<dynamic> userJsonList = json['Users'];
    // Convert each user JSON object to UserModel using its fromJson method
    final List<UserModel> users = userJsonList
        .map((userJson) => UserModel.fromJson(userJson as Map<String, dynamic>))
        .toList();

    // Extract the list of artist JSON objects
    final List<dynamic> artistJsonList = json['Artists'];
    // Convert each artist JSON object to ArtistModel using its fromJson method
    final List<ArtistModel> artists = artistJsonList
        .map((artistJson) => ArtistModel.fromJson(artistJson as Map<String, dynamic>))
        .toList();

    // Extract the list of song JSON objects
    // final List<dynamic> songJsonList = json['Songs'];
    // // Convert each song JSON object to SongModel using its fromJson method
    // final List<SongModel> songs = songJsonList
    //     .map((songJson) => SongModel.fromJson(songJson as Map<String, dynamic>))
    //     .toList();

    // Return a new MusicModel object with the lists of UserModel, SongModel, and ArtistModel objects
    return MusicModel(users: users, artists: artists);
  }

  const MusicModel._();
}
