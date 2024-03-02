import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

import '../entity/model_typedefs.dart';
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
    await delete(artist).go();

    // await transaction(() async {
    //   // Deleting tables in reverse topological order to avoid foreign-key conflicts
    //   final tables = allTables.toList().reversed;
    //
    //   for (final table in allTables) {
    //     await delete(table).go();
    //   }
    // });
  }

  ///
  /// build_runner generates the implementation of '_' CRUD methods
  /// based on the drift schema in the `tables.drift` file.
  ///
  @override
  Stream<List<UserTable>> watchUsers() => _getUsers().watch();

  @override
  Future<List<UserModel>> getUsers() => _getUsers().get();

  @override
  Future<UserTable?> getUser(int id) => _getUserById(id).getSingleOrNull();

  @override
  Stream<List<ArtistData>> watchArtists() => _getArtists().watch();

  @override
  Future<List<ArtistData>> getArtists() => _getArtists().get();

  @override
  Future<ArtistData?> getArtist(int id) => _getArtistById(id).getSingleOrNull();

  @override
  Stream<List<SongTable>> watchSongs() => _getSongs().watch();

  @override
  Future<List<SongTable>> getSongs() => _getSongs().get();

  @override
  Future<SongTable?> getSong(int id) => _getSongById(id).getSingleOrNull();

  @override
  Future<ArtistModel> insertArtist(ArtistModel model) async {
    final companion = ArtistCompanion.insert(
      id: Value(model.id),
      name: model.name,
      age: model.age,
      musicStyle: model.musicStyle,
      isActive: Value(model.isActive),
    );
    final id = await _insertArtist(
      companion.id.value,
      companion.name.value,
      companion.age.value,
      companion.musicStyle.value,
      companion.isActive.value,
    );
    return _getArtistById(id).getSingle();
  }

  @override
  Future<void> insertArtistList(List<ArtistModel> tables) async {
    for (final model in tables) {
      await insertArtist(model);
    }
  }

  @override
  Future<SongModel> insertSong(SongModel model) async {
    final companion = SongCompanion.insert(
      id: Value(model.id),
      name: model.name,
      duration: Value(model.duration),
      genre: Value(model.genre),
      album: Value(model.album),
      artistId: model.artistId,
    );
    final id = await _insertSong(
      companion.id.value,
      companion.name.value,
      companion.duration.value,
      companion.genre.value,
      companion.album.value,
      companion.artistId.value,
    );
    return _getSongById(id).getSingle();
  }

  @override
  Future<void> insertSongList(List<SongModel> models) async {
    for (final model in models) {
      await insertSong(model);
    }
  }

  @override
  Future<UserModel> insertUser(UserTable model) async {
    return UserModel(id: -1, username: '', musicStyle: '', favoriteSongName: '');
  }

  @override
  Future<void> insertUserList(List<UserModel> models) async {
    for (final model in models) {
      await insertUser(model);
    }
  }
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
