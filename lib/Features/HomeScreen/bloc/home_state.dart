part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class ProductInitial extends HomeState {}

class ProductLoadingState extends HomeState {}

class ProductEmptyState extends HomeState {}

class ProductLoadedState extends HomeState {
  const ProductLoadedState({required this.products});
  final List<ProductModel> products;
  @override
  List<Object> get props => [products];
}

class ProductLoadingFailedState extends HomeState {
  const ProductLoadingFailedState({required this.errorMessage});
  final String errorMessage;
}
