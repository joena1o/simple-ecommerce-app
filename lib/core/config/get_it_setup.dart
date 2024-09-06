import 'package:ecommerce/Features/Auth/data/repository/auth_repository.dart';
import 'package:ecommerce/Features/Auth/services/auth_service.dart';
import 'package:ecommerce/Features/HomeScreen/Data/repository/home_repository.dart';
import 'package:ecommerce/Features/ShoppingCart/data/stripe_payment_handle.dart';
import 'package:ecommerce/data/connection.dart';
import 'package:ecommerce/data/local_storage.dart';
import 'package:ecommerce/utils/dialog_services.dart';
import 'package:ecommerce/utils/navigator_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<NavigatorService>(() => NavigatorService());
  getIt.registerLazySingleton<DialogServices>(() => DialogServices());
  getIt.registerLazySingleton<AuthService>(() => AuthService(conn));
  getIt.registerLazySingleton<SharedPrefService>(() => SharedPrefService());
  getIt.registerLazySingleton<StripePaymentHandle>(() => StripePaymentHandle());
}
