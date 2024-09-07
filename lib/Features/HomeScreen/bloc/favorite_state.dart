part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState extends Equatable {
  const FavoriteState();
  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoadingState extends FavoriteState {}

final class FavoriteAddedState extends FavoriteState {
  final SuccessMessageModel favorites;
  const FavoriteAddedState({required this.favorites});
  @override
  List<Object> get props => [favorites];
}

final class FavoriteLoadedState extends FavoriteState {
  final List<FavoriteProductModel> favoriteItems;
  const FavoriteLoadedState({required this.favoriteItems});
  @override
  List<Object> get props => [favoriteItems];
}

final class FavoriteFailedState extends FavoriteState {
  final String message;
  const FavoriteFailedState({required this.message});
}
