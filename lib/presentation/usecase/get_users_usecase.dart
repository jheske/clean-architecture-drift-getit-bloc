import 'package:clean_architecture_drift_getit_bloc/presentation/usecase/usecase.dart';

import '../../data/repository/repository.dart';
import '../../domain/entity/user_entity.dart';

class GetUsersUseCase implements UseCase<List<UserEntity>, void> {
  final DatabaseRepository _repository;

  GetUsersUseCase(this._repository);

  @override
  Future<List<UserEntity>> call({void params}) {
    final users = _repository.getUsers();

    return users;
  }
}
