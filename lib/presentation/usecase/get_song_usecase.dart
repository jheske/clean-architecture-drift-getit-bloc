import 'package:clean_architecture_drift_getit_bloc/presentation/usecase/usecase.dart';

import '../../data/repository/repository.dart';
import '../../domain/entity/artist_entity.dart';

class GetArtistUseCase implements UseCase<ArtistEntity?, int> {
  final DatabaseRepository _repository;

  GetArtistUseCase(this._repository);

  @override
  Future<ArtistEntity?> call({int? params}) async {
    final artist = _repository.getArtist(params!);
    return artist;
  }
}
