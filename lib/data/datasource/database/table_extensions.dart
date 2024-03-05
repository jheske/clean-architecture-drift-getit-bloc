import '../../../domain/entity/playlist_entity.dart';
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

extension PlaylistTableExtension on PlaylistTable {
  PlaylistEntity toEntity() {
    return PlaylistEntity(
      id: id,
      name: name,
      userId: userId,
    );
  }
}
