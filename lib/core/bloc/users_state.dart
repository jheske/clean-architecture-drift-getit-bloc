import '../../domain/entity/user_entity.dart';

abstract class LocalUsersState {
  final List<UserEntity>? users;

  const LocalUsersState({this.users});
}

class LocalUsersLoading extends LocalUsersState {
  const LocalUsersLoading();
}

class LocalUsersDone extends LocalUsersState {
  const LocalUsersDone(List<UserEntity> users) : super(users: users);
}
