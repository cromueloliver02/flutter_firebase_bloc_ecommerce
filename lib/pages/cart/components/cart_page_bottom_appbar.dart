import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../blocs/blocs.dart';
import '../../../pages/pages.dart';

class CartPageBottomAppBar extends StatelessWidget {
  const CartPageBottomAppBar({super.key});

  void _goToCheckout(BuildContext ctx) => Navigator.pushNamed(
        ctx,
        CheckoutPage.id,
      );

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(top: 10),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<CartBloc, CartState, List<Product>>(
              selector: (state) => state.cart.products,
              builder: (ctx, products) {
                return ElevatedButton(
                  onPressed:
                      products.isEmpty ? null : () => _goToCheckout(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey,
                  ),
                  child: Text(
                    'GO TO CHECKOUT',
                    style: textTheme.headline3,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
