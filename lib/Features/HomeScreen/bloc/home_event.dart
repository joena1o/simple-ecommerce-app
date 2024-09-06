part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetProductEvent extends HomeEvent {}

class GetHomePageBanners extends HomeEvent {}

class AddToFavorites extends HomeEvent {
  final String userId;
  final String itemId;
  const AddToFavorites({required this.userId, required this.itemId});
}
