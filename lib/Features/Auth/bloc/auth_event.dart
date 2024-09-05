part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEventWithGoogle extends AuthEvent {
  final String idToken;
  const SignUpEventWithGoogle({required this.idToken});
}

class SignUpEventManually extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String? picture;
  const SignUpEventManually(
      {required this.name,
      required this.email,
      required this.password,
      required this.picture});
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;
  const SignInEvent(
      {required this.email, required this.password, required this.context});
}
