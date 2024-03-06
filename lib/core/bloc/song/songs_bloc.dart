import 'package:bloc/bloc.dart';
import 'package:clean_architecture_drift_getit_bloc/core/bloc/song/songs_event.dart';
import 'package:clean_architecture_drift_getit_bloc/core/bloc/song/songs_state.dart';

import '../../../domain/entity/song_entity.dart';
import '../../../presentation/usecase/get_songs_usecase.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  final GetSongsUseCase _getSongsUseCase;

  SongsBloc(this._getSongsUseCase) : super(const SongsLoading()) {
    on<GetSongs>(onGetSongs);
  }

  void onGetSongs(GetSongs event, Emitter<SongsState> emit) async {
    List<SongEntity> songs = await _getSongsUseCase();

    if (songs.isEmpty) {
      songs.add(
        SongEntity(
          id: 1,
          name: 'Mock song 1',
          duration: 3,
          artistName: 'Mock artist 1',
        ),
      );
    }
    emit(SongsDone(songs));
  }
}
