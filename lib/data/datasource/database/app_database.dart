import '../entity/model_typedefs.dart';
import 'app_database_impl.dart';

abstract class AppDatabase {
  Stream<List<ArtistTable>> watchArtists();
  Future<List<ArtistTable>> getArtists();
  Future<ArtistTable?> getArtist(int id);
  Stream<List<UserTable>> watchUsers();
  Future<List<UserModel>> getUsers();
  Future<UserModel?> getUser(int id);
  Stream<List<SongTable>> watchSongs();
  Future<List<SongTable>> getSongs();
  Future<SongTable?> getSong(int id);
}
