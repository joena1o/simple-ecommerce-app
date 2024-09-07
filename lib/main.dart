import 'package:ecommerce/Features/Auth/data/repository/auth_repository.dart';
import 'package:ecommerce/Features/Auth/bloc/auth_bloc.dart';
import 'package:ecommerce/Features/HomeScreen/Data/repository/home_repository.dart';
import 'package:ecommerce/Features/HomeScreen/bloc/favorite_bloc.dart';
import 'package:ecommerce/Features/HomeScreen/bloc/home_bloc.dart';
import 'package:ecommerce/Features/ShoppingCart/bloc/shopping_cart_bloc.dart';
import 'package:ecommerce/core/config/get_it_setup.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/app_routes.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  setup();
  await dotenv.load(fileName: "assets/.env");
  //Stripe.publishableKey = dotenv.env['PUBLIC_KEY'].toString();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) =>
              HomeBloc(homeRepository: getIt<HomeRepository>()),
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) =>
              AuthBloc(authRepository: getIt<AuthRepository>()),
        ),
        BlocProvider<ShoppingCartBloc>(
            create: (BuildContext context) => ShoppingCartBloc()),
        BlocProvider<FavoriteBloc>(
            create: (BuildContext context) =>
                FavoriteBloc(homeRepository: getIt<HomeRepository>())),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'E-commerce',
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.greenColor,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
          useMaterial3: true,
        ),
      ),
    );
  }
}
