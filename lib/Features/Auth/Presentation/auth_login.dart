import 'package:ecommerce/Features/Auth/Services/auth_service.dart';
import 'package:ecommerce/Features/Auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthLogin extends StatefulWidget {
  const AuthLogin({super.key});

  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadedState) {
            GoRouter.of(context).go('/home');
          }
        },
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                        hintText: "Enter your email address"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: password,
                    decoration:
                        const InputDecoration(hintText: "Enter your password"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: size.width,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () async {
                        callback();
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 16),
                      )),
                ),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          foregroundColor:
                              WidgetStateProperty.all(Colors.black54),
                          backgroundColor: WidgetStateColor.transparent),
                      onPressed: () async {
                        final GoogleSignInAccount? result =
                            await AuthService.signInWithGoogle();
                        callbackWithGoogle(result);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(
                              "assets/google.png",
                            ),
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Continue with Google",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.push("/auth");
                          },
                          child: const Text(
                            "Click here",
                            style: TextStyle(color: Colors.green, fontSize: 16),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    );
  }

  void callback() {
    BlocProvider.of<AuthBloc>(context)
        .add(SignInEvent(email: email.text, password: password.text));
  }

  void callbackWithGoogle(GoogleSignInAccount? result) {
    BlocProvider.of<AuthBloc>(context).add(SignUpEventManually(
        name: result!.displayName!,
        password: result.id,
        email: result.email,
        picture: result.displayName));
  }
}
