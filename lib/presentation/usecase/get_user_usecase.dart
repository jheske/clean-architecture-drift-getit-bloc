import 'package:clean_architecture_drift_getit_bloc/presentation/usecase/usecase.dart';

import '../../data/repository/db_repository.dart';
import '../../domain/entity/user_entity.dart';

class GetUserUseCase implements UseCase<UserEntity?, int> {
  final DatabaseRepository _repository;

  GetUserUseCase(this._repository);

  @override
  Future<UserEntity?> call({int? params}) async {
    return _repository.getUser(params!);
  }
}
