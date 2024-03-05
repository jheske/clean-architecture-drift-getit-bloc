import 'package:dio/dio.dart';

import '../../../domain/entity/artist_entity.dart';

abstract class ArtistsState {
  final List<ArtistEntity>? artists;
  final DioException? exception;

  const ArtistsState({this.artists, this.exception});
}

class ArtistsLoading extends ArtistsState {
  const ArtistsLoading.ArtistsLoading();
}

class ArtistsDone extends ArtistsState {
  const ArtistsDone.ArtistsDone(List<ArtistEntity> artists) : super(artists: artists);
}

class ArtistsError extends ArtistsState {
  const ArtistsError(DioException exception) : super(exception: exception);
}
