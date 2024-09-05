import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/Features/HomeScreen/Data/models/product_model.dart';
import 'package:ecommerce/Features/HomeScreen/Data/repository/home_repository.dart';
import 'package:ecommerce/helper/exception_handler.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(ProductInitial()) {
    on<GetProductEvent>((GetProductEvent event, Emitter<HomeState> emit) async {
      emit(ProductLoadingState());
      try {
        List<ProductModel> products = await homeRepository.getProducts();
        if (products.isEmpty) {
          emit(ProductEmptyState());
        } else {
          emit(ProductLoadedState(products: products));
        }
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(ProductLoadingFailedState(errorMessage: message));
      }
    });
  }
}
