// el que tiene la informacion del estado actual y procesa los eventos

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/user.dart';
//trabaja los tres archivos como si fueran uno solo
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {
      //emit para cambiar el estado
      //en el evento no se maneja el estado pero en el emit se genera el nuevo valor
      emit(UserSetState(event.user));
    });
    on<DeleteUser>((event, emit) => emit(const UserInitialState()));

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });
    on<AddProfession>((event, emit) {
      if (!state.existUser) return;

      final professions = [...state.user!.profesiones, event.profession];
      emit(UserSetState(state.user!.copyWith(profesiones: professions)));
    });
  }
}
