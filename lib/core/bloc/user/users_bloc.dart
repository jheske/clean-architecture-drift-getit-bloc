import 'package:bloc/bloc.dart';
import 'package:clean_architecture_drift_getit_bloc/core/bloc/user/users_event.dart';
import 'package:clean_architecture_drift_getit_bloc/core/bloc/user/users_state.dart';

import '../../../domain/entity/user_entity.dart';
import '../../../presentation/usecase/get_users_usecase.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUseCase _getUsersUseCase;

  UsersBloc(this._getUsersUseCase) : super(const UsersLoading.UsersLoading()) {
    on<GetUsers>(onGetUsers);
  }

  void onGetUsers(GetUsers event, Emitter<UsersState> emit) async {
    List<UserEntity> users = await _getUsersUseCase();
    if (users.isEmpty) {
      users.add(UserEntity(
          id: 1,
          username: 'Mock user 1',
          favoriteSongName: 'Mock song 1',
          musicStyle: 'Mock style 1'));
      users.add(UserEntity(
          id: 1,
          username: 'Mock user 2',
          favoriteSongName: 'Mock song 2',
          musicStyle: 'Mock style 2'));
      users.add(UserEntity(
          id: 1,
          username: 'Mock user 3',
          favoriteSongName: 'Mock song 3',
          musicStyle: 'Mock style 3'));
    }
    emit(UsersDone.UsersDone(users));
  }
}
