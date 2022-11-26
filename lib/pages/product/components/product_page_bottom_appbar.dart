import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../blocs/blocs.dart';
import '../../pages.dart';

class ProductPageBottomAppBar extends StatelessWidget {
  const ProductPageBottomAppBar({
    super.key,
    required this.product,
  });

  final Product product;

  void _addToWishlist(BuildContext ctx) {
    ctx.read<WishlistBloc>().add(AddWishlistEvent(product: product));

    ScaffoldMessenger.of(ctx)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(
        content: Text('Added to your wishlist'),
      ));
  }

  void _addToCart(BuildContext ctx) {
    Cart.addToCart(ctx, product);
    Navigator.pushNamed(ctx, CartPage.id);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(top: 10),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              color: Colors.white,
              icon: const Icon(Icons.share),
            ),
            IconButton(
              onPressed: () => _addToWishlist(context),
              color: Colors.white,
              icon: const Icon(Icons.favorite),
            ),
            ElevatedButton(
              onPressed: () => _addToCart(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                'ADD TO CART',
                style: textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
