import 'package:freezed_annotation/freezed_annotation.dart';
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
      Future.delayed(const Duration(seconds: 5));
      emit(state.copyWith(isLogged: true));
    });
  }
}
