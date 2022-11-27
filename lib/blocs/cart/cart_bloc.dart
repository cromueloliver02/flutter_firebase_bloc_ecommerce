import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    on<FetchCartItemsEvent>(_onFetchCartItems);
    on<AddCartItemEvent>(_onAddCartItem);
    on<RemoveCartItemEvent>(_onRemoveCartItem);
  }

  void _onFetchCartItems(
    FetchCartItemsEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(status: CartStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 3));

      emit(state.copyWith(
        status: CartStatus.loaded,
        cart: const Cart(),
      ));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: CartStatus.error,
        error: err,
      ));

      if (kDebugMode) print('Error: state $state');
    }
  }

  void _onAddCartItem(
    AddCartItemEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(status: CartStatus.loading));

    try {
      final List<Product> products = [...state.cart.products, event.product];

      emit(state.copyWith(
        status: CartStatus.loaded,
        cart: Cart(products: products),
      ));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: CartStatus.error,
        error: err,
      ));

      if (kDebugMode) print('Error: state $state');
    }
  }

  void _onRemoveCartItem(
    RemoveCartItemEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(status: CartStatus.loading));

    try {
      final List<Product> products = List<Product>.from(state.cart.products)
        ..remove(event.product);

      emit(state.copyWith(
        status: CartStatus.loaded,
        cart: Cart(products: products),
      ));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: CartStatus.error,
        error: err,
      ));

      if (kDebugMode) print('Error: state $state');
    }
  }
}
