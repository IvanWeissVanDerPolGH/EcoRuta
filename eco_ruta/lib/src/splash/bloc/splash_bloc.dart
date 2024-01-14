import 'dart:developer';

import 'package:eco_ruta/firebase_options.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState.initial()) {
    on<SplashEvent>(mapEventToState);
  }

  Future<void> mapEventToState(SplashEvent event, Emitter<SplashState> emit) {
    return event.map(started: (e) async {
      emit(state.copyWith(isLogged: false));
      log('Inicia el firebase');
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await Future.delayed(const Duration(seconds: 5));
      log('Finaliza el firebase');
      emit(state.copyWith(isLogged: true));
    });
  }
}
