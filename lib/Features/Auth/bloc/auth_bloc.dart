import 'package:bloc/bloc.dart';
import 'package:ecommerce/Features/Auth/Data/repository/auth_repository.dart';
import 'package:ecommerce/helper/helpers.dart';
import 'package:ecommerce/utils/navigator_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    NavigatorService navigatorService = NavigatorService();
    on<SignUpEventWithGoogle>(
        (SignUpEventWithGoogle event, Emitter<AuthState> emit) async {
      emit(AuthLoadingState());
      try {
        final user =
            await authRepository.signUpWithGoogle({"idToken": event.idToken});
        if (user == null) {
          emit(AuthEmptyState());
        } else {
          emit(AuthLoadedState(user: user));
          navigatorService.goToAndReplace("/");
        }
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(AuthFailedState(errorMessage: message));
      }
    });

    on<SignUpEventManually>(
        (SignUpEventManually event, Emitter<AuthState> emit) async {
      emit(AuthLoadingState());
      try {
        final user = await authRepository.signUpManually({
          "name": event.name,
          "email": event.email,
          "password": event.password
        });
        if (user == null) {
          emit(AuthEmptyState());
        } else {
          emit(AuthLoadedState(user: user));
        }
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(AuthFailedState(errorMessage: message));
      }
    });

    on<SignInEvent>((SignInEvent event, Emitter<AuthState> emit) async {
      emit(AuthLoadingState());
      try {
        final user = await authRepository
            .signIn({"email": event.email, "password": event.password});
        if (user == null) {
          emit(AuthEmptyState());
        } else {
          emit(AuthLoadedState(user: user));
        }
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(AuthFailedState(errorMessage: message));
      }
    });
  }
}
