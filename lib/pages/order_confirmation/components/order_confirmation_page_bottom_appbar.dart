import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../blocs/blocs.dart';
import '../../../pages/pages.dart';

class OrderConfirmationPageBottomAppBar extends StatelessWidget {
  const OrderConfirmationPageBottomAppBar({super.key});

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
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomePage.id,
                      (route) => route.settings.name == SplashPage.id),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey,
                  ),
                  child: Text(
                    'GO BACK TO SHOPPING',
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
