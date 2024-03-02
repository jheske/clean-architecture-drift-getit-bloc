import '../entity/model_typedefs.dart';
import 'app_database_impl.dart';

abstract class AppDatabase {
  Future<void> clearDatabase();
  // READ - SELECT Methods
  Stream<List<ArtistData>> watchArtists();
  Future<List<ArtistData>> getArtists();
  Future<ArtistData?> getArtist(int id);
  Stream<List<UserTable>> watchUsers();
  Future<List<UserModel>> getUsers();
  Future<UserModel?> getUser(int id);
  Stream<List<SongTable>> watchSongs();
  Future<List<SongTable>> getSongs();
  Future<SongTable?> getSong(int id);
  // CREATE/INSERT and UPDATE Methods
  Future<ArtistModel> insertArtist(ArtistModel artist);
  Future<void> insertArtistList(List<ArtistModel> tables);
}
