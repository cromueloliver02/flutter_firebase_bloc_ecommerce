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
  late final StreamSubscription _paymentSubscription;
  final CartBloc cartBloc;
  final PaymentBloc paymentBloc;
  final CheckoutRepository checkoutRepository;

  CheckoutBloc({
    required this.cartBloc,
    required this.paymentBloc,
    required this.checkoutRepository,
  }) : super(CheckoutState.initial()) {
    _cartSubscription = cartBloc.stream.listen(_cartListener);
    _paymentSubscription = paymentBloc.stream.listen(_paymentListener);

    on<UpdateCheckoutEvent>(_onUpdateCheckout);
    on<ConfirmCheckoutEvent>(_onConfirmCheckout);
  }

  @override
  Future<void> close() {
    _cartSubscription.cancel();
    _paymentSubscription.cancel();
    return super.close();
  }

  void _cartListener(CartState cartState) {
    if (cartState.status != CartStatus.loaded) return;

    final cart = cartState.cart;

    add(UpdateCheckoutEvent(
      products: cart.products,
      subtotal: cart.subtotalString,
      deliveryFee: cart.deliveryFeeString,
      total: cart.totalString,
    ));
  }

  void _paymentListener(PaymentState paymentState) {
    if (paymentState is PaymentLoaded) {
      add(UpdateCheckoutEvent(
        paymentMethod: paymentState.paymentMethod,
      ));
    }
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
      paymentMethod: event.paymentMethod,
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
