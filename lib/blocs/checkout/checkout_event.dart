part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckoutEvent extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final PaymentMethod? paymentMethod;

  const UpdateCheckoutEvent({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.paymentMethod,
  });

  @override
  List<Object?> get props => [
        products,
        subtotal,
        deliveryFee,
        total,
        paymentMethod,
      ];
}

class ConfirmCheckoutEvent extends CheckoutEvent {}
