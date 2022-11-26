part of 'cart_bloc.dart';

class CartState extends Equatable {
  final CartStatus status;
  final Cart cart;
  final CustomError error;

  const CartState({
    required this.status,
    required this.cart,
    required this.error,
  });

  factory CartState.initial() {
    return const CartState(
      status: CartStatus.initial,
      cart: Cart(),
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [status, cart, error];

  @override
  String toString() => 'CartState(status: $status, cart: $cart, error: $error)';

  CartState copyWith({
    CartStatus? status,
    Cart? cart,
    CustomError? error,
  }) {
    return CartState(
      status: status ?? this.status,
      cart: cart ?? this.cart,
      error: error ?? this.error,
    );
  }
}

enum CartStatus {
  initial,
  loading,
  loaded,
  error,
}
