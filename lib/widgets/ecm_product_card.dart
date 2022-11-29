import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/models.dart';
import '../blocs/blocs.dart';
import '../pages/pages.dart';

class ECMProductCard extends StatelessWidget {
  const ECMProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 0,
    this.isWishList = false,
  }) : super(key: key);

  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;

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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
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
                    const Spacer(),
                    BlocSelector<CartBloc, CartState, CartStatus>(
                      selector: (state) => state.status,
                      builder: (ctx, status) {
                        if (status == CartStatus.loading) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        return IconButton(
                          onPressed: () => _addToCart(context),
                          color: Colors.white,
                          icon: const Icon(Icons.add_circle),
                        );
                      },
                    ),
                    if (isWishList)
                      IconButton(
                        onPressed: () {},
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
