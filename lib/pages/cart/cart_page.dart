import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';
import '../../pages/pages.dart';
import 'components/cart_page_bottom_appbar.dart';
import 'components/cart_product_list.dart';

class CartPage extends StatelessWidget {
  static const id = '/cart';

  const CartPage({super.key});

  void _goToHome(BuildContext ctx) => Navigator.pushNamed(ctx, HomePage.id);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'Cart'),
      ),
      bottomNavigationBar: const CartPageBottomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocSelector<CartBloc, CartState, Cart>(
                        selector: (state) => state.cart,
                        builder: (ctx, cart) => Text(
                          cart.freeDelivery,
                          style: textTheme.headline5,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _goToHome(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(),
                          elevation: 0,
                        ),
                        child: Text(
                          'Add More Items',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const CartProductList(),
                ],
              ),
            ),
            const ECMOrderSummary(),
          ],
        ),
      ),
    );
  }
}
