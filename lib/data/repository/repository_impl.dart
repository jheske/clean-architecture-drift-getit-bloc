import 'dart:io';

import 'package:clean_architecture_drift_getit_bloc/data/datasource/database/table_extensions.dart';
import 'package:clean_architecture_drift_getit_bloc/data/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
    print('[saveToDatabase]');

    await _db.insertArtistList(musicModel.artists);
    await _db.insertSongList(musicModel.songs);
    await _db.insertUserList(musicModel.users);

    final firstUser = await getUser(12345);

    if (kDebugMode) {
      print('[saveToDatabase getUsers] first user name: ${firstUser?.username ?? 'none'}');
    }
    final firstArtist = await _db.getArtist(1);
    final firstSong = await _db.getSong(1);

    if (kDebugMode) {
      print('[saveToDatabase] first artist name: ${firstArtist?.name ?? 'none'}');
      print('[saveToDatabase] first song name: ${firstSong?.name ?? 'none'}');
    }
  }

  @override
  // TODO the database should support returning user with playlist.
  /// This function returns users directly from the User table, without playlist.
  /// Use this on the main Users screen to list names of users.
  Future<List<UserEntity>> getUsers() async {
    PlaylistEntity playlistEntity = const PlaylistEntity();
    List<UserEntity> entityList = [];
    final userTables = await _db.getUsers();

    await Future.forEach(userTables, (userTable) async {
      final playlistTable = await _db.getPlaylistByUserId(userTable.id);
      if (playlistTable != null) {
        playlistEntity = playlistTable.toEntity();
      }
      entityList.add(userTable.toEntity(playlistEntity));
    });
    return entityList;
  }

  @override
  Future<UserEntity?> getUser(int id) async {
    final userTable = await _db.getUser(id);
    if (userTable != null) {
      return userTable.toEntity(const PlaylistEntity());
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
}
