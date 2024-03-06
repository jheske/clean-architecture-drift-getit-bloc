import 'package:dio/dio.dart';

import '../../../domain/entity/song_entity.dart';

abstract class SongsState {
  final List<SongEntity>? songs;
  final DioException? exception;

  const SongsState({this.songs, this.exception});
}

class SongsLoading extends SongsState {
  const SongsLoading();
}

class SongsDone extends SongsState {
  const SongsDone(List<SongEntity> songs) : super(songs: songs);
}

class SongsError extends SongsState {
  const SongsError(DioException exception) : super(exception: exception);
}
