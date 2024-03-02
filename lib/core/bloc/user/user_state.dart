import 'package:dio/dio.dart';

import '../../../domain/entity/user_entity.dart';

abstract class LocalUserState {
  final UserEntity? user;
  final DioException? exception;

  const LocalUserState({this.user, this.exception});
}

class LocalUserLoading extends LocalUserState {
  const LocalUserLoading();
}

class LocalUserDone extends LocalUserState {
  const LocalUserDone(UserEntity user) : super(user: user);
}

class LocalUserError extends LocalUserState {
  const LocalUserError(DioException exception) : super(exception: exception);
}
