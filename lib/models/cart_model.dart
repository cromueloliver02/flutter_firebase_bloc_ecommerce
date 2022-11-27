import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import 'models.dart';
import '../blocs/blocs.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  Map<Product, int> cartMap(List<Product> products) {
    final map = <Product, int>{};

    for (final d in products) {
      if (!map.containsKey(d)) map[d] = 0;

      map[d] = map[d]! + 1;
    }

    return map;
  }

  double get _subtotal =>
      products.fold(0.0, (total, current) => total + current.price);

  double get _deliveryFee {
    if (_subtotal >= 30) return 0.0;

    return 10.0;
  }

  double get _total => _subtotal + _deliveryFee;

  String get freeDelivery {
    if (_subtotal >= 30) return 'You have Free Delivery';

    final double missing = 30.0 - _subtotal;
    return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery';
  }

  String get subtotalString => _subtotal.toStringAsFixed(2);
  String get deliveryFeeString => _deliveryFee.toStringAsFixed(2);
  String get totalString => _total.toStringAsFixed(2);

  static void addToCart(BuildContext ctx, Product product) =>
      ctx.read<CartBloc>().add(AddCartItemEvent(product: product));

  static void removeToCart(BuildContext ctx, Product product) =>
      ctx.read<CartBloc>().add(RemoveCartItemEvent(product: product));

  @override
  List<Object> get props => [products];
}
