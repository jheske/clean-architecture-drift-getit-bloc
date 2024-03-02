import '../../domain/entity/user_entity.dart';
import '../datasource/remote/model/music_model.dart';

abstract class DatabaseRepository {
  // //Stream<List<ArtistTable>> watchArtists();
  // Future<List<ArtistTable>> getArtists();
  // Future<ArtistTable?> getArtist(int id);
  // // Stream<List<UserTable>> watchUsers();
  Future<List<UserEntity>> getUsers();
  Future<UserEntity?> getUser(int id);
  // // Stream<List<SongTable>> watchSongs();
  // Future<List<SongTable>> getSongs();
  // Future<SongTable?> getSong(int id);
  Future<void> saveToDatabase(MusicModel musicModel);
  Future<MusicModel> fetchMusic();
}