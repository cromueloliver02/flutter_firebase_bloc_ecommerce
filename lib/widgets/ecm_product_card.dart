import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/models.dart';
import '../blocs/blocs.dart';
import '../pages/pages.dart';

class ECMProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  final double widthFactor;
  final double leftPosition;
  final bool isCatalog;
  final bool isWishList;
  final bool isCart;

  const ECMProductCard({
    super.key,
    required this.product,
    this.quantity = 0,
    this.widthFactor = 2.5,
    this.leftPosition = 0,
    this.isCatalog = false,
    this.isWishList = false,
    this.isCart = false,
  });

  const ECMProductCard.catalog({
    super.key,
    required this.product,
    this.quantity = 0,
    this.widthFactor = 2.2,
    this.leftPosition = 0,
    this.isCatalog = true,
    this.isWishList = false,
    this.isCart = false,
  });

  const ECMProductCard.wishlist({
    super.key,
    required this.product,
    this.quantity = 0,
    this.widthFactor = 1.1,
    this.leftPosition = 100,
    this.isCatalog = false,
    this.isWishList = true,
    this.isCart = false,
  });

  const ECMProductCard.cart({
    super.key,
    required this.product,
    required this.quantity,
    this.widthFactor = 2.5,
    this.leftPosition = 0,
    this.isCatalog = false,
    this.isWishList = false,
    this.isCart = true,
  });

  void _onTap(BuildContext ctx) => Navigator.pushNamed(
        ctx,
        ProductPage.id,
        arguments: product,
      );

  void _addToCart(BuildContext ctx) {
    ScaffoldMessenger.of(ctx)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('Product Added')),
      );

    Cart.addToCart(ctx, product);
  }

  void _removeToWishlist(BuildContext ctx) {
    ScaffoldMessenger.of(ctx)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('Product Removed')),
      );

    ctx.read<WishlistBloc>().add(RemoveWishlistEvent(product: product));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    if (isCart) {
      return Row(
        children: [
          CachedNetworkImage(
            imageUrl: product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: textTheme.headline5,
                ),
                Text(
                  '${product.price}',
                  style: textTheme.headline6,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              IconButton(
                onPressed: () => Cart.removeToCart(context, product),
                icon: const Icon(Icons.remove_circle),
              ),
              Text('$quantity', style: textTheme.headline5),
              IconButton(
                onPressed: () => Cart.addToCart(context, product),
                icon: const Icon(Icons.add_circle),
              ),
            ],
          ),
        ],
      );
    }

    return InkWell(
      onTap: () => _onTap(context),
      child: Stack(
        children: [
          SizedBox(
            height: 150,
            width: screenSize.width / widthFactor,
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              height: 80,
              width: screenSize.width / widthFactor,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 10,
            right: 10,
            child: Container(
              height: 70,
              width: screenSize.width / widthFactor - 10,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    BlocSelector<CartBloc, CartState, CartStatus>(
                      selector: (state) => state.status,
                      builder: (ctx, status) {
                        if (status == CartStatus.loading) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          );
                        }

                        return IconButton(
                          onPressed: () => _addToCart(context),
                          color: Colors.white,
                          iconSize: 20,
                          icon: const Icon(Icons.add_circle),
                        );
                      },
                    ),
                    if (isWishList)
                      IconButton(
                        onPressed: () => _removeToWishlist(context),
                        color: Colors.white,
                        icon: const Icon(Icons.delete),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
