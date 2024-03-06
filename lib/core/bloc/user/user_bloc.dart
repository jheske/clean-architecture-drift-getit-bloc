import 'package:bloc/bloc.dart';
import 'package:clean_architecture_drift_getit_bloc/core/bloc/user/user_event.dart';
import 'package:clean_architecture_drift_getit_bloc/core/bloc/user/user_state.dart';

import '../../../domain/entity/user_entity.dart';
import '../../../presentation/usecase/get_user_usecase.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase _getUserUseCase;

  UserBloc(this._getUserUseCase) : super(const UserLoading()) {
    on<GetUser>(onGetUser);
  }

  void onGetUser(GetUser getUser, Emitter<UserState> emit) async {
    final user = await _getUserUseCase(params: getUser.id);

    if (user != null) {
      emit(UserDone(user));
    } else {
      emit(
        UserDone(
          UserEntity(
            id: 1,
            username: 'Mock user 1',
            favoriteSongName: 'Mock song 1',
          ),
        ),
      );
    }
  }
}
