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

import '../../data/datasource/remote/model/song_model.dart';
import 'artist_entity.dart';

class SongEntity {
  int id;
  String? name;
  int? duration;
  ArtistEntity? artist = ArtistEntity();

  SongEntity({
    this.id = -1,
    this.name = '',
    this.duration = 0,
    this.artist,
  });

  void setSong(SongEntity song) {
    id = song.id;
    name = song.name;
    duration = song.duration;
    artist = song.artist;
  }

  static Future<SongEntity?> convertTableToEntity(SongModel? songModel) async {
    if (songModel != null) {
      return SongEntity(
        id: songModel.id,
        name: songModel.name,
        duration: songModel.duration,
      );
    } else {
      return null;
    }
  }

  // SongModel toModel() {
  //   return SongModel(
  //     id: id,
  //     name: name,
  //     duration: duration,
  //     artistId: artist?.id,
  //   );
  // }
}
