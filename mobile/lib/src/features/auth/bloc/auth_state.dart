part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.login = const FetchState<dynamic>(),
    this.register = const FetchState<dynamic>(),
  });

  final FetchState<dynamic> login;
  final FetchState<dynamic> register;

  AuthState reset() {
    return AuthState(register: register.reset(), login: login.reset());
  }

  AuthState copyWith(
      {FetchState<dynamic>? login, FetchState<dynamic>? register}) {
    return AuthState(
        login: login ?? this.login, register: register ?? this.register);
  }

  @override
  List<dynamic> get props => [login, register];
}
