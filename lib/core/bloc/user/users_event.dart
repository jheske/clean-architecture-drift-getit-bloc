import 'package:clean_architecture_drift_getit_bloc/domain/entity/user_entity.dart';

abstract class UsersEvent {
  final UserEntity? user;

  const UsersEvent({this.user});
}

class GetUsers extends UsersEvent {
  const GetUsers();
}
