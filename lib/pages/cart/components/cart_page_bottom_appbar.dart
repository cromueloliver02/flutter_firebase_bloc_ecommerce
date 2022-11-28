import 'package:flutter/material.dart';

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
            ElevatedButton(
              onPressed: () => _goToCheckout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Text(
                'GO TO CHECKOUT',
                style: textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
