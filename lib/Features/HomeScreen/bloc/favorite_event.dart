part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class AddToFavoriteEvent extends FavoriteEvent {
  final String userId;
  final String itemId;
  const AddToFavoriteEvent({required this.itemId, required this.userId});
}

class GetFavoriteEvent extends FavoriteEvent {
  final String userId;
  const GetFavoriteEvent({required this.userId});
}
