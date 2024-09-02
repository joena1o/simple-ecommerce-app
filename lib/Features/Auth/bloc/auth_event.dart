part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEventWithGoogle extends AuthEvent {
  final String idToken;
  const SignUpEventWithGoogle(this.idToken);
}
