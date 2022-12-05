import 'package:equatable/equatable.dart';

import 'models.dart';

class Checkout extends Equatable {
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String country;
  final String zipCode;
  final List<Product> products;
  final String subtotal;
  final String deliveryFee;
  final String total;
  final PaymentMethod paymentMethod;

  const Checkout({
    this.fullName = '',
    this.email = '',
    this.address = '',
    this.city = '',
    this.country = '',
    this.zipCode = '',
    this.products = const <Product>[],
    this.subtotal = '',
    this.deliveryFee = '',
    this.total = '',
    this.paymentMethod = PaymentMethod.googlePay,
  });

  @override
  List<Object> get props {
    return [
      fullName,
      email,
      address,
      city,
      country,
      zipCode,
      products,
      subtotal,
      deliveryFee,
      total,
      paymentMethod,
    ];
  }

  @override
  String toString() {
    return 'Checkout(fullName: $fullName, email: $email, address: $address, city: $city, country: $country, zipCode: $zipCode, products: $products, subtotal: $subtotal, deliveryFee: $deliveryFee, total: $total, paymentMethod: $paymentMethod)';
  }

  Map<String, dynamic> toMap() {
    final customerAddress = <String, dynamic>{};
    final result = <String, dynamic>{};

    customerAddress.addAll({'address': address});
    customerAddress.addAll({'city': city});
    customerAddress.addAll({'country': country});
    customerAddress.addAll({'zipCode': zipCode});

    result.addAll({'customerAddress': customerAddress});
    result.addAll({'customerName': fullName});
    result.addAll({'customerEmail': email});
    result.addAll({'products': products.map((x) => x.name).toList()});
    result.addAll({'subtotal': subtotal});
    result.addAll({'deliveryFee': deliveryFee});
    result.addAll({'total': total});
    result.addAll({'paymentMethod': paymentMethod});

    return result;
  }

  Checkout copyWith({
    String? fullName,
    String? email,
    String? address,
    String? city,
    String? country,
    String? zipCode,
    List<Product>? products,
    String? subtotal,
    String? deliveryFee,
    String? total,
    PaymentMethod? paymentMethod,
  }) {
    return Checkout(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
      products: products ?? this.products,
      subtotal: subtotal ?? this.subtotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      total: total ?? this.total,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
}
