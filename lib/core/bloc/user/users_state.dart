import 'package:dio/dio.dart';

import '../../../domain/entity/user_entity.dart';

abstract class LocalUsersState {
  final List<UserEntity>? users;
  final DioException? exception;

  const LocalUsersState({this.users, this.exception});
}

class LocalUsersLoading extends LocalUsersState {
  const LocalUsersLoading();
}

class LocalUsersDone extends LocalUsersState {
  const LocalUsersDone(List<UserEntity> users) : super(users: users);
}

class LocalUsersError extends LocalUsersState {
  const LocalUsersError(DioException exception) : super(exception: exception);
}
