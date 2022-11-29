part of 'checkout_bloc.dart';

class CheckoutState extends Equatable {
  final CheckoutStatus status;
  final Checkout checkout;
  final CustomError error;

  const CheckoutState({
    required this.status,
    required this.checkout,
    required this.error,
  });

  factory CheckoutState.initial() {
    return const CheckoutState(
      status: CheckoutStatus.initial,
      checkout: Checkout(),
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [status, checkout, error];

  @override
  String toString() =>
      'CheckoutState(status: $status, checkout: $checkout, error: $error)';

  CheckoutState copyWith({
    CheckoutStatus? status,
    Checkout? checkout,
    CustomError? error,
  }) {
    return CheckoutState(
      status: status ?? this.status,
      checkout: checkout ?? this.checkout,
      error: error ?? this.error,
    );
  }
}

enum CheckoutStatus {
  initial,
  submitting,
  success,
  error,
}
