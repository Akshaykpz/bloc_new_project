part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitalEvnet extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {}

class HomeProductCarttButtonClickedEvent extends HomeEvent {}

class HomeProductWishlistNavigateButtonEvent extends HomeEvent {}

class HomeProductCartNavigateButtonEvent extends HomeEvent {}
