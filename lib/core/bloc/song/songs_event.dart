import 'package:clean_architecture_drift_getit_bloc/domain/entity/song_entity.dart';

abstract class SongsEvent {
  final SongEntity? song;

  const SongsEvent({this.song});
}

class GetSongs extends SongsEvent {
  const GetSongs();
}
