import 'package:bloc/bloc.dart';
import 'package:clean_architecture_drift_getit_bloc/core/bloc/artist/artists_event.dart';
import 'package:clean_architecture_drift_getit_bloc/core/bloc/artist/artists_state.dart';

import '../../../domain/entity/artist_entity.dart';
import '../../../presentation/usecase/get_artists_usecase.dart';

class ArtistsBloc extends Bloc<ArtistsEvent, ArtistsState> {
  final GetArtistsUseCase _getArtistsUseCase;

  ArtistsBloc(this._getArtistsUseCase) : super(const ArtistsLoading.ArtistsLoading()) {
    on<GetArtists>(onGetArtists);
  }

  void onGetArtists(GetArtists event, Emitter<ArtistsState> emit) async {
    List<ArtistEntity> artists = await _getArtistsUseCase();
    if (artists.isEmpty) {
      artists.add(
        ArtistEntity(id: 1, musicStyle: 'Mock style 1'),
      );
    }
    emit(ArtistsDone.ArtistsDone(artists));
  }
}
