import 'package:dio/dio.dart';

import '../../../domain/entity/artist_entity.dart';

abstract class ArtistState {
  final ArtistEntity? artist;
  final DioException? exception;

  const ArtistState({this.artist, this.exception});
}

class ArtistLoading extends ArtistState {
  const ArtistLoading();
}

class ArtistDone extends ArtistState {
  const ArtistDone(ArtistEntity artist) : super(artist: artist);
}

class ArtistError extends ArtistState {
  const ArtistError(DioException exception) : super(exception: exception);
}
