import '../remote/model/artist_model.dart';
import '../remote/model/song_model.dart';
import '../remote/model/user_model.dart';
import 'app_database_impl.dart';

abstract class AppDatabase {
  Future<void> clearDatabase();
  // READ - SELECT Methods
  Stream<List<ArtistTable>> watchArtists();
  Future<List<ArtistTable>> getArtists();
  Future<ArtistTable?> getArtist(int id);
  Stream<List<UserTable>> watchUsers();
  Future<List<UserTable>> getUsers();
  Future<UserTable?> getUser(int id);
  Stream<List<SongTable>> watchSongs();
  Future<List<SongTable>> getSongs();
  Future<SongTable?> getSong(int id);
  Future<PlaylistTable?> getPlaylistByUserId(int id);
  Future<List<SongTable>> getSongsInPlaylist(int playlistId);
  Future<List<SongTable>> getSongsByArtist(int artistId);
  Future<List<GetSongsWithArtistsResult>> getSongsWithArtists();
  // CREATE/INSERT and UPDATE Methods
  Future<int> insertArtist(ArtistModel model);
  Future<void> insertArtistList(List<ArtistModel> models);
  Future<int> insertSong(SongModel model);
  Future<void> insertSongList(List<SongModel> models);
  Future<int> insertUser(UserModel model);
  Future<void> insertUserList(List<UserModel> models);
}
