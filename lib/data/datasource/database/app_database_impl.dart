import 'dart:io';

import 'package:clean_architecture_drift_getit_bloc/data/datasource/remote/model/model_extensions.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

import '../remote/model/artist_model.dart';
import '../remote/model/song_model.dart';
import '../remote/model/user_model.dart';
import 'app_database.dart';

part '.generated/app_database_impl.g.dart';

typedef Val<T> = Value<T>;

@DriftDatabase(include: {'schema.drift'})
class AppDatabaseImpl extends _$AppDatabaseImpl implements AppDatabase {
  AppDatabaseImpl() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  Future<void> clearDatabase() async {
    // TODO loop thru database.tables
    if (kDebugMode) {
      print('[clearDatabase]: deleting all tables');
    }
    await delete(artist).go();
    await delete(song).go();
    await delete(user).go();
    await delete(playlist).go();
    await delete(playlistWithSongs).go();
  }

  ///
  /// build_runner generates the implementation of '_' CRUD methods
  /// based on the drift schema in the `tables.drift` file.
  ///
  @override
  Stream<List<UserTable>> watchUsers() => _getUsers().watch();

  @override
  Future<List<UserTable>> getUsers() => _getUsers().get();

  @override
  Future<UserTable?> getUser(int id) => _getUserById(id).getSingleOrNull();

  @override
  Stream<List<ArtistTable>> watchArtists() => _getArtists().watch();

  @override
  Future<List<ArtistTable>> getArtists() => _getArtists().get();

  @override
  Future<ArtistTable?> getArtist(int id) => _getArtistById(id).getSingleOrNull();

  @override
  Stream<List<SongTable>> watchSongs() => _getSongs().watch();

  @override
  Future<List<SongTable>> getSongs() => _getSongs().get();

  @override
  Future<SongTable?> getSong(int id) => _getSongById(id).getSingleOrNull();

  @override
  Future<PlaylistTable?> getPlaylistByUserId(int id) {
    return _getPlaylistByUserId(id).getSingleOrNull();
  }

  @override
  Future<int> insertArtist(ArtistModel model) async {
    final companion = await model.toCompanion();
    final id = await _insertArtist(
      companion.id.value,
      companion.name.value,
      companion.age.value,
      companion.musicStyle.value,
      companion.isActive.value,
    );
    return id;
  }

  @override
  Future<void> insertArtistList(List<ArtistModel> tables) async {
    for (final model in tables) {
      await insertArtist(model);
    }
  }

  @override
  Future<int> insertSong(SongModel model) async {
    final companion = await model.toCompanion();

    final id = await _insertSong(
      companion.id.value,
      companion.name.value,
      companion.duration.value,
      companion.genre.value,
      companion.album.value,
      companion.artistId.value,
    );
    // final song = await _getSongById(id).getSingleOrNull();
    // if (kDebugMode) {
    //   print('[insertSong]: $song');
    // }
    return id;
  }

  @override
  Future<void> insertSongList(List<SongModel> models) async {
    for (final model in models) {
      await insertSong(model);
    }
  }

  @override
  Future<int> insertUser(UserModel model) async {
    final companion = model.toCompanion();
    final id = await _insertUser(
      companion.id.value,
      companion.username.value,
      companion.musicStyle.value,
      companion.favoriteSongName.value,
    );
    // if (model.playlist != null) {
    //   await playlist!.();
    // }

    final user = await _getUserById(id).getSingleOrNull();
    if (kDebugMode) {
      print('[insertUser]: $user');
    }
    return id;
  }

  @override
  Future<void> insertUserList(List<UserModel> models) async {
    for (final model in models) {
      await insertUser(model);
    }
  }

  // Future<void> insertPlaylistWithSongs(PlaylistModel model) async {
  //   final companion = model.toCompanion();
  //   await _insertPlaylist(
  //     companion.id.value,
  //     companion.name.value,
  //     companion.description.value,
  //     companion.userId.value,
  //   );
  //   for (final song in model.songs) {
  //     await insertSong(song);
  //   }
  // }

  // Future<void> insertPlaylist(PlaylistModel model) async {
  //   final companion = PlaylistCompanion.insert(
  //     id: Value(model.id),
  //     name: model.name,
  //     description: model.description,
  //     userId: model.userId,
  //   );
  //   await _insertPlaylist(
  //     companion.id.value,
  //     companion.name.value,
  //     companion.description.value,
  //     companion.userId.value,
  //   );
  // }
}

// Function to open the database connection.
LazyDatabase _openConnection() {
  // The LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // Put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file); // Create the database in the background.
  });
}
