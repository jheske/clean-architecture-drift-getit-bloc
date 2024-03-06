import 'package:bloc/bloc.dart';

import '../../../domain/entity/artist_entity.dart';
import '../../../presentation/usecase/get_artist_usecase.dart';
import 'artist_event.dart';
import 'artist_state.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  final GetArtistUseCase _getArtistUseCase;

  ArtistBloc(this._getArtistUseCase) : super(const ArtistLoading()) {
    on<GetArtist>(onGetArtist);
  }

  void onGetArtist(GetArtist getArtist, Emitter<ArtistState> emit) async {
    final artist = await _getArtistUseCase(params: getArtist.id);

    if (artist != null) {
      emit(ArtistDone(artist));
    } else {
      emit(
        ArtistDone(
          ArtistEntity(id: 1, name: 'Mock user 1', age: 20, musicStyle: 'Mock style 1'),
        ),
      );
    }
  }
}
