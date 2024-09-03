import 'package:ecommerce/Features/Auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  TextEditingController firstName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: firstName,
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return "Enter your full-name";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter your full-name"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: email,
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return "Enter your email address";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter your email address"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: password,
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return "Enter your password";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter your password"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: confirmPassword,
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return "Confirm password";
                        } else if (text != password.text) {
                          return "Password do not match";
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: "Confirm Password"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    width: size.width,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () async {
                          //final idToken = await AuthService.getGoogleIdToken();
                          callback();
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            alignment: Alignment.center,
                            foregroundColor:
                                WidgetStateProperty.all(Colors.black54),
                            backgroundColor: WidgetStateColor.transparent),
                        onPressed: () async {
                          callback();
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
                              context.push("/login");
                            },
                            child: const Text(
                              "Click here",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 16),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void callback() {
    BlocProvider.of<AuthBloc>(context).add(SignUpEventManually(
        name: firstName.text, password: password.text, email: email.text));
  }
}
