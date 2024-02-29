import '../../domain/entity/user_entity.dart';

abstract class DatabaseRepository {
  // //Stream<List<ArtistTable>> watchArtists();
  // Future<List<ArtistTable>> getArtists();
  // Future<ArtistTable?> getArtist(int id);
  // // Stream<List<UserTable>> watchUsers();
  Future<List<UserEntity>> getUsers();
  // Future<UserTable?> getUser(int id);
  // // Stream<List<SongTable>> watchSongs();
  // Future<List<SongTable>> getSongs();
  // Future<SongTable?> getSong(int id);
}
