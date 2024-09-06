part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoadingState extends FavoriteState {}

final class FavoriteLoadedState extends FavoriteState {
  final List<ProductModel> favorites;
  const FavoriteLoadedState({required this.favorites});
  @override
  List<Object> get props => [favorites];
}

final class FavoriteFailedState extends FavoriteState {
  final String message;
  const FavoriteFailedState({required this.message});
}
