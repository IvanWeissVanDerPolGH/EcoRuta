import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        log('Email ${state.email!}');
        log('Password ${state.password!}');
        emit(state.copyWith(
          email: e.email,
          failureOrSuccessOptions: none(),
          showOverlayLoader: none(),
        ));
      },
      updatePassword: (e) async {
        log('Email ${state.email!}');
        log('Password ${state.password!}');
        emit(state.copyWith(
          password: e.password,
          failureOrSuccessOptions: none(),
          showOverlayLoader: none(),
        ));
      },
      login: (e) async {
        emit(
          state.copyWith(
            showOverlayLoader: some(true),
            failureOrSuccessOptions: none(),
          ),
        );
        try {
          log("Inicia el inicio de sesion");
          log('Email ${state.email!}');
          log('Password ${state.password!}');
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(email: state.email!, password: state.password!);
          log("Termina el inicio de sesion");
          emit(
            state.copyWith(
              showOverlayLoader: some(false),
              failureOrSuccessOptions: some(right(null)),
            ),
          );
        } on Exception catch (e) {
          log(e.toString());
          emit(
            state.copyWith(
              showOverlayLoader: some(false),
              failureOrSuccessOptions: optionOf(left(e)),
            ),
          );
        }
      },
    );
  }
}
