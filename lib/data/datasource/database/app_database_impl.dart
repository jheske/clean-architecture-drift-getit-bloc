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
