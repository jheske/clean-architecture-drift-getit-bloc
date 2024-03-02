import 'dart:io';

import 'package:clean_architecture_drift_getit_bloc/data/repository/repository.dart';
import 'package:dio/dio.dart';

import '../../domain/entity/playlist_entity.dart';
import '../../domain/entity/user_entity.dart';
import '../datasource/database/app_database.dart';
import '../datasource/remote/app_api_service.dart';
import '../datasource/remote/model/music_model.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _db;
  final ApiService _apiService;

  DatabaseRepositoryImpl(this._db, this._apiService);

  @override
  Future<void> saveToDatabase(MusicModel musicModel) async {
    _db.insertArtistList(musicModel.artists);
  }

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

  @override
  Future<UserEntity?> getUser(int id) async {
    final user = await _db.getUser(id);
    if (user != null) {
      return await UserEntity.toEntity(user, PlaylistEntity());
    } else {
      return null;
    }
  }

  @override
  Future<MusicModel> fetchMusic() async {
    try {
      final httpResponse = await _apiService.fetchMusic();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return httpResponse.data;
      } else {
        return MusicModel.init();
      }
    } on DioException catch (e) {
      return MusicModel.init();
    }
  }

  // @override
  // Future<dynamic> fetchMusic() {
  //   return _apiService.fetchMusic();
  // }
}
