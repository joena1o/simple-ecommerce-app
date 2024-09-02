import 'package:ecommerce/Features/Auth/Services/auth_service.dart';
import 'package:ecommerce/Features/Auth/bloc/auth_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      final idToken = await AuthService.getGoogleIdToken();
                      callback(idToken);
                    },
                    child: const Text("Sign In with Google"))
              ],
            ),
          );
        },
      ),
    );
  }

  void callback(idToken) {
    context.read<AuthBloc>().add(SignUpEventWithGoogle(idToken!));
  }
}
