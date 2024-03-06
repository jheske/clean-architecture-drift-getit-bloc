import '../../domain/entity/artist_entity.dart';
import '../../domain/entity/song_entity.dart';
import '../../domain/entity/user_entity.dart';
import '../datasource/remote/model/music_model.dart';

abstract class DatabaseRepository {
  // //Stream<List<ArtistTable>> watchArtists();
  Future<List<ArtistEntity>> getArtists();
  Future<ArtistEntity?> getArtist(int id);
  // // Stream<List<UserTable>> watchUsers();
  Future<List<UserEntity>> getUsers();
  Future<UserEntity?> getUser(int id);
  Future<List<SongEntity>> getSongs();
  Future<void> saveToDatabase(MusicModel musicModel);
  Future<MusicModel> fetchMusic();
}
