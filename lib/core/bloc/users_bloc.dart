import 'package:bloc/bloc.dart';
import 'package:clean_architecture_drift_getit_bloc/core/bloc/users_event.dart';
import 'package:clean_architecture_drift_getit_bloc/core/bloc/users_state.dart';

import '../../presentation/usecase/get_users_usecase.dart';

class LocalUserBloc extends Bloc<LocalUsersEvent, LocalUsersState> {
  final GetUsersUseCase _getUsersUseCase;

  LocalUserBloc(this._getUsersUseCase) : super(const LocalUsersLoading()) {
    on<GetUsers>(onGetUsers);
  }

  void onGetUsers(GetUsers event, Emitter<LocalUsersState> emit) async {
    final users = await _getUsersUseCase();
    emit(LocalUsersDone(users));
  }
}
