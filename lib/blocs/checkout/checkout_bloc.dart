import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../../blocs/blocs.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  late final StreamSubscription _cartSubscription;
  final CartBloc cartBloc;
  final CheckoutRepository checkoutRepository;

  CheckoutBloc({
    required this.cartBloc,
    required this.checkoutRepository,
  }) : super(CheckoutState.initial()) {
    _cartSubscription = cartBloc.stream.listen((CartState cartState) {
      if (cartState.status == CartStatus.loaded) {
        final cart = cartState.cart;

        add(UpdateCheckoutEvent(
          products: cart.products,
          subtotal: cart.subtotalString,
          deliveryFee: cart.deliveryFeeString,
          total: cart.totalString,
        ));
      }
    });

    on<UpdateCheckoutEvent>(_onUpdateCheckout);
    on<ConfirmCheckoutEvent>(_onConfirmCheckout);
  }

  @override
  Future<void> close() {
    _cartSubscription.cancel();
    return super.close();
  }

  void _onUpdateCheckout(
    UpdateCheckoutEvent event,
    Emitter<CheckoutState> emit,
  ) {
    final checkout = state.checkout.copyWith(
      fullName: event.fullName,
      email: event.email,
      address: event.address,
      city: event.city,
      country: event.country,
      zipCode: event.zipCode,
      products: event.products,
      subtotal: event.subtotal,
      deliveryFee: event.deliveryFee,
      total: event.total,
    );

    emit(state.copyWith(checkout: checkout));
  }

  void _onConfirmCheckout(
    ConfirmCheckoutEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(state.copyWith(status: CheckoutStatus.submitting));

    try {
      await checkoutRepository.addCheckout(state.checkout);

      emit(state.copyWith(status: CheckoutStatus.success));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: CheckoutStatus.error,
        error: err,
      ));

      if (kDebugMode) print('Error: state $state');
    }
  }
}
