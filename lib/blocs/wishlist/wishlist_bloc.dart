import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistState.initial()) {
    on<FetchWishlistEvent>(_onFetchWishlist);
    on<AddWishlistEvent>(_onAddWishlist);
    on<RemoveWishlistEvent>(_onRemoveWishlist);
  }

  void _onFetchWishlist(
    FetchWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(status: WishlistStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 3));

      emit(state.copyWith(
        status: WishlistStatus.loaded,
        wishlist: const Wishlist(),
      ));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: WishlistStatus.error,
        error: err,
      ));

      if (kDebugMode) print('Error: state $state');
    }
  }

  void _onAddWishlist(
    AddWishlistEvent event,
    Emitter<WishlistState> emit,
  ) {
    emit(state.copyWith(status: WishlistStatus.loading));

    try {
      final List<Product> products = [
        event.product,
        ...state.wishlist.products
      ];

      emit(state.copyWith(
        status: WishlistStatus.loaded,
        wishlist: Wishlist(products: products),
      ));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: WishlistStatus.error,
        error: err,
      ));

      if (kDebugMode) print('Error: state $state');
    }
  }

  void _onRemoveWishlist(
    RemoveWishlistEvent event,
    Emitter<WishlistState> emit,
  ) {
    emit(state.copyWith(status: WishlistStatus.loading));

    try {
      final List<Product> products = List<Product>.from(state.wishlist.products)
        ..remove(event.product);

      emit(state.copyWith(
        status: WishlistStatus.loaded,
        wishlist: Wishlist(products: products),
      ));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: WishlistStatus.error,
        error: err,
      ));

      if (kDebugMode) print('Error: state $state');
    }
  }
}
