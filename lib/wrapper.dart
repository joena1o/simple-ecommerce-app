import "dart:async";
import "package:ecommerce/Features/Auth/bloc/auth_bloc.dart";
import "package:ecommerce/data/local_storage.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      loadSharedPref();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadedState) {
          context.go("/home");
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return const Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "E-commerce App",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ))
            ],
          ),
        );
      },
    );
  }

  void loadApp(email, password) async {
    if (email != null && password != null) {
      BlocProvider.of<AuthBloc>(context)
          .add(SignInEvent(email: email, password: password));
    } else {
      context.go("/login");
    }
  }

  void loadSharedPref() async {
    email = await SharedPrefService.getItem("email");
    password = await SharedPrefService.getItem("password");
    loadApp(email, password);
  }
}
