import 'package:clean_architecture_drift_getit_bloc/domain/entity/artist_entity.dart';

abstract class ArtistsEvent {
  final ArtistEntity? artist;

  const ArtistsEvent({this.artist});
}

class GetArtists extends ArtistsEvent {
  const GetArtists();
}
