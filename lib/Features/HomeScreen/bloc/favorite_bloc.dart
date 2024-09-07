import 'package:bloc/bloc.dart';
import 'package:ecommerce/Features/HomeScreen/Data/models/favorite_model.dart';
import 'package:ecommerce/Features/HomeScreen/Data/models/success_model.dart';
import 'package:ecommerce/Features/HomeScreen/Data/repository/home_repository.dart';
import 'package:ecommerce/core/config/get_it_setup.dart';
import 'package:ecommerce/helper/exception_handler.dart';
import 'package:ecommerce/utils/dialog_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final HomeRepository homeRepository;
  FavoriteBloc({required this.homeRepository}) : super(FavoriteInitial()) {
    on<AddToFavoriteEvent>(
        (AddToFavoriteEvent event, Emitter<FavoriteState> emit) async {
      emit(FavoriteLoadingState());
      try {
        SuccessMessageModel response = await homeRepository
            .addToWishList({"userId": event.userId, "itemId": event.itemId});
        emit(FavoriteAddedState(favorites: response));
        getIt<DialogServices>().showMessage(response.message);
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(FavoriteFailedState(message: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });
    on<GetFavoriteEvent>(
        (GetFavoriteEvent event, Emitter<FavoriteState> emit) async {
      emit(FavoriteLoadingState());
      try {
        final response = await homeRepository.getWishListItems(event.userId);
        emit(FavoriteLoadedState(favoriteItems: response));
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(FavoriteFailedState(message: message));
        getIt<DialogServices>().showMessageError(message);
      }
    });
  }
}
