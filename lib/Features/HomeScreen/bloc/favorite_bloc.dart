import 'package:bloc/bloc.dart';
import 'package:ecommerce/Features/HomeScreen/Data/models/product_model.dart';
import 'package:ecommerce/Features/HomeScreen/Data/repository/home_repository.dart';
import 'package:ecommerce/helper/exception_handler.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final HomeRepository homeRepository;
  FavoriteBloc({required this.homeRepository}) : super(FavoriteInitial()) {
    on<AddToFavoriteEvent>(
        (AddToFavoriteEvent event, Emitter<FavoriteState> emit) async {
      try {
        final products = await homeRepository
            .addToWishList({"userId": event.userId, "itemId": event.itemId});
        emit(FavoriteLoadedState(favorites: products));
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(FavoriteFailedState(message: message));
      }
    });
  }
}
