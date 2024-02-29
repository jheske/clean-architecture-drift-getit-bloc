import 'package:bloc/bloc.dart';
import 'package:clean_architecture_drift_getit_bloc/core/bloc/user/user_event.dart';
import 'package:clean_architecture_drift_getit_bloc/core/bloc/user/user_state.dart';

import '../../../domain/entity/user_entity.dart';
import '../../../presentation/usecase/get_user_usecase.dart';

class LocalUserBloc extends Bloc<LocalUserEvent, LocalUserState> {
  final GetUserUseCase _getUserUseCase;

  LocalUserBloc(this._getUserUseCase) : super(const LocalUserLoading()) {
    on<GetUser>(onGetUser);
  }

  void onGetUser(GetUser getUser, Emitter<LocalUserState> emit) async {
    await _getUserUseCase(params: getUser.id);
    final user = await _getUserUseCase();
    if (user != null) {
      emit(LocalUserDone(user));
    } else {
      emit(LocalUserDone(UserEntity()));
    }
  }
}
