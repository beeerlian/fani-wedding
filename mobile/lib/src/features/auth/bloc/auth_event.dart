part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String number;

  const RegisterEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.number});
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
}
