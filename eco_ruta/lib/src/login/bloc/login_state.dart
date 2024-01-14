part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    String? email,
    String? password,
  }) = _LoginBloc;

  factory LoginState.initial() => const LoginState(
        email: '',
        password: '',
      );
}
