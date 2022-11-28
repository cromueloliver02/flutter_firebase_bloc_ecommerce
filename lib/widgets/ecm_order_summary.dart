import 'package:flutter/material.dart';

import '../models/models.dart';
import '../blocs/blocs.dart';

class ECMOrderSummary extends StatelessWidget {
  const ECMOrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return BlocSelector<CartBloc, CartState, Cart>(
      selector: (state) => state.cart,
      builder: (context, cart) => Column(
        children: [
          const Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SUBTOTAL',
                      style: textTheme.headline5,
                    ),
                    Text(
                      '\$${cart.subtotalString}',
                      style: textTheme.headline5,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DELIVERY FEE',
                      style: textTheme.headline5,
                    ),
                    Text(
                      '\$${cart.deliveryFeeString}',
                      style: textTheme.headline5,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: screenSize.width,
                height: 60,
                color: Colors.black.withAlpha(50),
              ),
              Container(
                color: Colors.black,
                height: 50,
                width: screenSize.width,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TOTAL',
                      style: textTheme.headline5!.copyWith(color: Colors.white),
                    ),
                    Text(
                      '\$${cart.totalString}',
                      style: textTheme.headline5!.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
