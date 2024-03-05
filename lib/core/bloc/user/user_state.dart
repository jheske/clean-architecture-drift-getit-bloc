import 'package:dio/dio.dart';

import '../../../domain/entity/user_entity.dart';

abstract class UserState {
  final UserEntity? user;
  final DioException? exception;

  const UserState({this.user, this.exception});
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserDone extends UserState {
  const UserDone(UserEntity user) : super(user: user);
}

class UserError extends UserState {
  const UserError(DioException exception) : super(exception: exception);
}
