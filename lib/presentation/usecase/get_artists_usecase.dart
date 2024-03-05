import 'package:clean_architecture_drift_getit_bloc/presentation/usecase/usecase.dart';

import '../../data/repository/repository.dart';
import '../../domain/entity/artist_entity.dart';

class GetArtistsUseCase implements UseCase<List<ArtistEntity>, void> {
  final DatabaseRepository _repository;

  GetArtistsUseCase(this._repository);

  @override
  Future<List<ArtistEntity>> call({void params}) {
    final users = _repository.getArtists();

    return users;
  }
}
