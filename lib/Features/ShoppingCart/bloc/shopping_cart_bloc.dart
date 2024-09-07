import 'package:ecommerce/core/config/get_it_setup.dart';
import 'package:ecommerce/utils/dialog_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/Features/HomeScreen/Data/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(ShoppingCartInitial()) {
    on<AddToShoppingCartEvent>(
        (AddToShoppingCartEvent event, Emitter<ShoppingCartState> emit) {
      if (state is ShoppingCartLoadedState) {
        // Access the products from the current loaded state
        final currentState = state as ShoppingCartLoadedState;
        if (!currentState.products.contains(event.product)) {
          final updatedList = List<ProductModel>.from(currentState.products)
            ..add(event.product);
          emit(ShoppingCartLoadedState(products: updatedList));
          getIt<DialogServices>().showMessage("Item has been added to cart");
        } else {
          getIt<DialogServices>().showMessageError("Item already added");
        }
      } else {
        final initialList = [event.product];
        emit(ShoppingCartLoadedState(products: initialList));
        getIt<DialogServices>().showMessage("Item has been added to cart");
      }
    });

    on<RemoveShoppingItemEvent>(
      (RemoveShoppingItemEvent event, Emitter<ShoppingCartState> emit) {
        if (state is ShoppingCartLoadedState) {
          final currentState = state as ShoppingCartLoadedState;
          final updatedList = List<ProductModel>.from(currentState.products)
            ..remove(event.product);
          if (updatedList.isEmpty) {
            emit(ShoppingCartInitial());
          } else {
            emit(ShoppingCartLoadedState(products: updatedList));
          }
        }
        getIt<DialogServices>().showMessage("Item has been removed from cart");
      },
    );
  }
}
