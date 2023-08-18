import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/grocery_data.dart';
import '../model/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitalEvnet>(homeInitalEvnet);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCarttButtonClickedEvent>(homeProductCarttButtonClickedEvent);

    on<HomeProductWishlistNavigateButtonEvent>(
        homeProductWishlistNavigateButtonEvent);
    on<HomeProductCartNavigateButtonEvent>(homeProductCartNavigateButtonEvent);
  }
  FutureOr<void> homeInitalEvnet(
      HomeInitalEvnet event, Emitter<HomeState> emit) async {
    emit(HomeLoadedState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSucessState(
        products: GrocerryData.groceery
            .map((e) => ProductDataModel(
                id: e['id'] ?? '',
                name: e['name'] ?? '',
                description: e['descriptions'] ?? '',
                price: e['price'] ?? '',
                imageurl: e['imageurl'] ?? ''))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    log('wishlist product clicked');
  }

  FutureOr<void> homeProductCarttButtonClickedEvent(
      HomeProductCarttButtonClickedEvent event, Emitter<HomeState> emit) {
    log('Cart proudct clicked');
  }

  FutureOr<void> homeProductWishlistNavigateButtonEvent(
      HomeProductWishlistNavigateButtonEvent event, Emitter<HomeState> emit) {
    log('wishlist........');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartNavigateButtonEvent(
      HomeProductCartNavigateButtonEvent event, Emitter<HomeState> emit) {
    log('cart.........');
    emit(HomeNavigateToCartPageActionState());
  }
}
