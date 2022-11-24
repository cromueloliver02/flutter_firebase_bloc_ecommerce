import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../models/models.dart';
import 'widgets.dart';

class ECMHeroCarouselProducts extends StatelessWidget {
  const ECMHeroCarouselProducts({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.5,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        items: products.map((d) => ECMHeroCard(product: d)).toList(),
      ),
    );
  }
}
