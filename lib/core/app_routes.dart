import 'package:ecommerce/Features/Auth/presentation/auth_login.dart';
import 'package:ecommerce/Features/Auth/presentation/auth_sign.dart';
import 'package:ecommerce/Features/HomeScreen/Data/models/product_model.dart';
import 'package:ecommerce/Features/ShoppingCart/presentation/shopping_cart.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce/Features/HomeScreen/Presentation/home_screen.dart';
import 'package:ecommerce/Features/ItemScreen/Presentation/item_screen.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/auth', builder: (context, state) => const Auth()),
    GoRoute(path: '/login', builder: (context, state) => const AuthLogin()),
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
        path: '/item',
        builder: (context, state) {
          final ProductModel productModel = state.extra as ProductModel;
          return ItemScreen(
            productModel: productModel,
          );
        }),
    GoRoute(
        path: '/cart', builder: (context, state) => const ShoppingCartPage())
  ],
);

GoRouter get router => _router;
