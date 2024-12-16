part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

class CartActionState extends CartState {}

final class CartInitial extends CartState {}

final class CartSuccessState extends CartState {
  final List<ProductsDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

class CartRemovedActionState extends CartActionState {}
