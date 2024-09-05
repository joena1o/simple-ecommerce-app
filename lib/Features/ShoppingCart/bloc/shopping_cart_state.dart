part of 'shopping_cart_bloc.dart';

sealed class ShoppingCartState extends Equatable {
  const ShoppingCartState();
  @override
  List<Object> get props => [];
}

final class ShoppingCartInitial extends ShoppingCartState {}

final class ShoppingCartLoadedState extends ShoppingCartState {
  const ShoppingCartLoadedState({required this.products});
  final List<ProductModel> products;
  @override
  List<Object> get props => [products];
  ShoppingCartLoadedState copyWith({List<ProductModel>? products}) {
    return ShoppingCartLoadedState(products: products ?? this.products);
  }
}
