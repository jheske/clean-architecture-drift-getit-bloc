import 'package:clean_architecture_drift_getit_bloc/data/datasource/remote/model/artist_model.dart';
import 'package:clean_architecture_drift_getit_bloc/data/datasource/remote/model/song_model.dart';
import 'package:clean_architecture_drift_getit_bloc/data/datasource/remote/model/user_model.dart';
import 'package:drift/drift.dart';

import '../../database/app_database_impl.dart';

extension UserModelExtension on UserModel {
  toCompanion() {
    return UserCompanion(
      id: Value(id ?? -1),
      username: Value(username ?? ''),
      musicStyle: Value(musicStyle ?? ''),
      favoriteSongName: Value(favoriteSongName ?? ''),
    );
  }
}

extension ArtistModelExtension on ArtistModel {
  toCompanion() {
    return ArtistCompanion(
        id: Value(id ?? -1),
        name: Value(name ?? ''),
        musicStyle: Value(musicStyle ?? ''),
        age: Value(age ?? 0));
  }
}

extension SongModelExtension on SongModel {
  toCompanion() {
    return SongCompanion(
        id: Value(id ?? -1),
        name: Value(name ?? ''),
        genre: Value(genre ?? ''),
        album: Value(album ?? ''),
        duration: Value(duration ?? 0),
        artistId: Value(artistId ?? -1));
  }
}

// extension PlaylistModelExtension on PlaylistModel {
//   toCompanion()  {
//     return PlaylistCompanion(
//       id: Value(id ?? -1),
//       name: Value(name ?? ''),
//       userId: Value(userId ?? 0),
//     );
//   }
// extension PlaylistWithSongModelExtension on PlaylistWithSongModel {
//    toCompanion()  {
//     return PlaylistWithSongCompanion(
//       songId: Value(songId ?? -1),
//       playlistId: Value(playlistId ?? -1),
//     );
//   }