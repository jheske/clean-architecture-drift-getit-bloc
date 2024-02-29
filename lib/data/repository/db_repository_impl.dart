import 'package:clean_architecture_drift_getit_bloc/data/repository/db_repository.dart';

import '../../domain/entity/playlist_entity.dart';
import '../../domain/entity/user_entity.dart';
import '../datasource/database/app_database.dart';
import '../datasource/remote/app_api_service.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _db;
  final ApiService _apiService;

  DatabaseRepositoryImpl(this._db, this._apiService);

  ///
  /// build_runner generates the implementation of '_' CRUD methods
  /// based on the drift schema in the `tables.drift` file.
  ///
  @override
  Future<List<UserEntity>> getUsers() async {
    List<UserEntity> users = [];
    final userModels = await _db.getUsers();

    for (var model in userModels) {
      final entity = await UserEntity.toEntity(model, PlaylistEntity());
      if (entity != null) {
        users.add(entity);
      }
    }
    return users;
  }

  //
  // @override
  // Future<UserTable?> getUser(int id) => _getUserById(id).getSingleOrNull();
  //
  // @override
  // Future<List<ArtistTable>> getArtists() => _getArtists().get();
  //
  // @override
  // Future<ArtistTable?> getArtist(int id) => _getArtistById(id).getSingleOrNull();
  //
  // @override
  // Future<List<SongTable>> getSongs() => _getSongs().get();
  //
  // @override
  // Future<SongTable?> getSong(int id) => _getSongById(id).getSingleOrNull();
}
