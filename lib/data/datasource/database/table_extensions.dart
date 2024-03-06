import '../../../domain/entity/artist_entity.dart';
import '../../../domain/entity/playlist_entity.dart';
import '../../../domain/entity/song_entity.dart';
import '../../../domain/entity/user_entity.dart';
import '../remote/model/user_model.dart';
import 'app_database_impl.dart';

extension UserTableExtension on UserTable {
  UserModel toModel() {
    return UserModel(
      id: id,
      username: username,
      musicStyle: musicStyle,
      favoriteSongName: favoriteSongName,
    );
  }

  UserEntity toEntity(PlaylistEntity? playlist) {
    return UserEntity(
        id: id,
        username: username,
        musicStyle: musicStyle,
        favoriteSongName: favoriteSongName,
        playlist: playlist);
  }
}

extension ArtistTableExtension on ArtistTable {
  ArtistEntity toEntity(List<SongEntity> songs) {
    return ArtistEntity(
      id: id,
      name: name,
      musicStyle: musicStyle,
      age: age,
      isActive: isActive == 1,
      songs: songs,
    );
  }
}

extension SongTableExtension on SongTable {
  SongEntity toEntity() {
    return SongEntity(
      id: id,
      name: name,
      duration: duration,
      artist: ArtistEntity(),
    );
  }
}

extension PlaylistTableExtension on PlaylistTable {
  PlaylistEntity toEntity(List<SongEntity> songEntityList) {
    return PlaylistEntity(
      id: id,
      name: name,
      userId: userId,
      songs: songEntityList,
    );
  }
}
