part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthEmptyState extends AuthState {}

class AuthLoadedState extends AuthState {
  const AuthLoadedState({required this.user});
  final Map<String, dynamic> user;
  @override
  List<Object> get props => [user];
}

class AuthFailedState extends AuthState {
  const AuthFailedState({required this.errorMessage});
  final String errorMessage;
}
