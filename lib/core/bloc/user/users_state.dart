import 'package:dio/dio.dart';

import '../../../domain/entity/user_entity.dart';

abstract class UsersState {
  final List<UserEntity>? users;
  final DioException? exception;

  const UsersState({this.users, this.exception});
}

class UsersLoading extends UsersState {
  const UsersLoading();
}

class UsersDone extends UsersState {
  const UsersDone(List<UserEntity> users) : super(users: users);
}

class UsersError extends UsersState {
  const UsersError(DioException exception) : super(exception: exception);
}
