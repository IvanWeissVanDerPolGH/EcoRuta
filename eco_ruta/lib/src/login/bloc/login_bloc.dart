import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<LoginEvent>(mapEventToState);
  }

  Future<void> mapEventToState(LoginEvent event, Emitter<LoginState> emit) {
    return event.map(
      updateEmail: (e) async {
        emit(state.copyWith(
          email: e.email,
        ));
      },
      updatePassword: (e) async {
        emit(state.copyWith(
          email: e.password,
        ));
      },
      login: (e) async {},
    );
  }
}
