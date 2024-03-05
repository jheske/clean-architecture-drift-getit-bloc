import 'dart:io';

import 'package:clean_architecture_drift_getit_bloc/data/datasource/database/table_extensions.dart';
import 'package:clean_architecture_drift_getit_bloc/data/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entity/artist_entity.dart';
import '../../domain/entity/playlist_entity.dart';
import '../../domain/entity/song_entity.dart';
import '../../domain/entity/user_entity.dart';
import '../datasource/database/app_database.dart';
import '../datasource/database/app_database_impl.dart';
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

    if (kDebugMode) {
      final firstRepoUser = await getUser(12345);

      if (kDebugMode) {
        print('[saveToDatabase] repo getUser() name: ${firstRepoUser?.username ?? 'none'}');
      }

      final firstArtist = await _db.getArtist(1);
      final firstSong = await _db.getSong(1);
      print('[saveToDatabase] first _db.getArtist name: ${firstArtist?.name ?? 'none'}');
      print('[saveToDatabase] first _db.getSong name: ${firstSong?.name ?? 'none'}');
    }
  }

  @override

  /// This function returns users directly from the User table, WITHOUT a playlist.
  /// Use this on the main Users screen to list names of users.
  Future<List<UserEntity>> getUsers() async {
    PlaylistEntity playlistEntity = const PlaylistEntity();
    List<UserEntity> entityList = [];
    final userTables = await _db.getUsers();

    await Future.forEach(userTables, (userTable) async {
      entityList.add(userTable.toEntity(playlistEntity));
    });
    return entityList;
  }

  @override
  Future<UserEntity?> getUser(int id) async {
    final userTable = await _db.getUser(id);
    PlaylistEntity playlistEntity = const PlaylistEntity();
    final List<SongEntity> songEntities = [];

    if (userTable != null) {
      final PlaylistTable? playlistTable = await _db.getPlaylistByUserId(id);
      final playlistWithSongs = await _db.getPlaylistWithSongs(playlistTable!.id);
      for (var song in playlistWithSongs) {
        songEntities.add(song.toEntity());
      }
      playlistEntity = playlistTable.toEntity(songEntities);

      final entity = userTable.toEntity(playlistEntity);
      return entity;
    } else {
      return null;
    }
  }

  @override
  Future<ArtistEntity?> getArtist(int id) async {
    final artistTable = await _db.getArtist(id);
    return artistTable?.toEntity();
  }

  @override
  Future<List<ArtistEntity>> getArtists() async {
    List<ArtistEntity> entityList = [];

    final artistTables = await _db.getArtists();
    for (var artistTable in artistTables) {
      entityList.add(artistTable.toEntity());
    }
    return entityList;
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
