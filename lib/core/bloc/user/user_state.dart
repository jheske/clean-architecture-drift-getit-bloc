import '../../../domain/entity/user_entity.dart';

abstract class LocalUserState {
  final UserEntity? user;

  const LocalUserState({this.user});
}

class LocalUserLoading extends LocalUserState {
  const LocalUserLoading();
}

class LocalUserDone extends LocalUserState {
  const LocalUserDone(UserEntity user) : super(user: user);
}
