import 'package:ecommerce/Features/Auth/data/models/models.dart';
import 'package:ecommerce/Features/Auth/presentation/auth_login.dart';
import 'package:ecommerce/data/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/Features/Auth/data/repository/auth_repository.dart';
import 'package:ecommerce/core/config/get_it_setup.dart';
import 'package:ecommerce/helper/helpers.dart';
import 'package:ecommerce/utils/dialog_services.dart';
import 'package:ecommerce/utils/navigator_service.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    NavigatorService navigatorService = getIt<NavigatorService>();
    on<SignUpEventManually>(
        (SignUpEventManually event, Emitter<AuthState> emit) async {
      emit(AuthLoadingState());
      try {
        final user = await authRepository.signUpManually({
          "name": event.name,
          "email": event.email,
          "password": event.password,
          "picture": event.picture
        });
        emit(AuthLoadedState(user: user));
        navigatorService.goToAndReplace(const AuthLogin());
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(AuthFailedState(errorMessage: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });

    on<SignInEvent>((SignInEvent event, Emitter<AuthState> emit) async {
      emit(AuthLoadingState());
      try {
        final user = await authRepository
            .signIn({"email": event.email, "password": event.password});
        SharedPrefService.saveItem("auth", user.token);
        emit(AuthLoadedState(user: user));
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(AuthFailedState(errorMessage: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });
  }
}
