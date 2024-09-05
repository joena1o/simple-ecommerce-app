part of 'shopping_cart_bloc.dart';

@immutable
sealed class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();
  @override
  List<Object> get props => [];
}

class AddToShoppingCartEvent extends ShoppingCartEvent {
  final ProductModel product;
  const AddToShoppingCartEvent({required this.product});
}

class RemoveShoppingItemEvent extends ShoppingCartEvent {
  final ProductModel product;
  const RemoveShoppingItemEvent({required this.product});
}
