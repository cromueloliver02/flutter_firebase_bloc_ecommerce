import 'package:flutter/material.dart';

import '../models/models.dart';
import 'widgets.dart';

class ECMProductCarousel extends StatelessWidget {
  const ECMProductCarousel({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 165,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          separatorBuilder: (ctx, idx) => const SizedBox(width: 10),
          itemBuilder: (ctx, idx) => ECMProductCard(
            product: products[idx],
          ),
        ),
      ),
    );
  }
}
