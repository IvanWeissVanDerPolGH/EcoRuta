part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    String? email,
    String? password,
    @required Option<Either<Exception, void>>? failureOrSuccessOptions,
    Option<bool>? showOverlayLoader,
  }) = _LoginBloc;

  factory LoginState.initial() => LoginState(
        email: '',
        password: '',
        failureOrSuccessOptions: none(),
        showOverlayLoader: none(),
      );
}
