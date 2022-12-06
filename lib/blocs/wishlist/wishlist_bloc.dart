import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../repositories/repositories.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final LocalStorageRepository localStorageRepository;

  WishlistBloc({
    required this.localStorageRepository,
  }) : super(WishlistState.initial()) {
    on<LoadWishlistEvent>(_onLoadWishlist);
    on<AddWishlistEvent>(_onAddWishlist);
    on<RemoveWishlistEvent>(_onRemoveWishlist);
  }

  void _onLoadWishlist(
    LoadWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(status: WishlistStatus.loading));

    try {
      final Box<Product> box =
          await localStorageRepository.openBox(kWishlistBoxName);

      final List<Product> products = localStorageRepository.getWishlist(box);

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

  void _onAddWishlist(
    AddWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(state.copyWith(status: WishlistStatus.loading));

    try {
      final Box<Product> box =
          await localStorageRepository.openBox(kWishlistBoxName);

      localStorageRepository.addProductToWishlist(box, event.product);

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
  ) async {
    emit(state.copyWith(status: WishlistStatus.loading));

    try {
      final Box<Product> box =
          await localStorageRepository.openBox(kWishlistBoxName);

      localStorageRepository.removeProductFromWishlist(
        box,
        event.product,
      );

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
