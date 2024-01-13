part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    bool? isLogged,
  }) = _SplashBloc;

  factory SplashState.initial() => const SplashState(
        isLogged: false,
      );
}
