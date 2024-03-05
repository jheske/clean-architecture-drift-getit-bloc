// TODO Equatable??
class ArtistEvent {}

class GetArtist extends ArtistEvent {
  final int id;

  GetArtist({
    required this.id,
  });
}
