import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/models.dart';

class ECMCartProductCard extends StatelessWidget {
  const ECMCartProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
              onPressed: () {},
              icon: const Icon(Icons.remove_circle),
            ),
            Text('1', style: textTheme.headline5),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle),
            ),
          ],
        ),
      ],
    );
  }
}
