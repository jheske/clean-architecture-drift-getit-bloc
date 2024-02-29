import 'package:clean_architecture_drift_getit_bloc/domain/entity/user_entity.dart';

abstract class LocalUsersEvent {
  final UserEntity? user;

  const LocalUsersEvent({this.user});
}

class GetUsers extends LocalUsersEvent {
  const GetUsers();
}
