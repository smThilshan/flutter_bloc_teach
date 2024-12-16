import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_experiment/data/cart_items.dart';
import 'package:flutter_bloc_experiment/features/home/models/home_products_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    // get your cart item
    // check is your product model there in your cartItems - true
    // run a fun to remove that product model from thatt cart model
    // finally emit a state

    cartItems.remove(event.productDataModel);

    emit(CartSuccessState(cartItems: cartItems));
    emit(CartRemovedActionState());
  }
}
