import 'package:clean_architecture_drift_getit_bloc/presentation/usecase/usecase.dart';

import '../../data/repository/repository.dart';
import '../../domain/entity/song_entity.dart';

class GetSongsUseCase implements UseCase<List<SongEntity>, void> {
  final DatabaseRepository _repository;

  GetSongsUseCase(this._repository);

  @override
  Future<List<SongEntity>> call({void params}) {
    return _repository.getSongs();
  }
}
