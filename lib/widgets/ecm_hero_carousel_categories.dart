import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../models/models.dart';
import 'widgets.dart';

class ECMHeroCarouselCategories extends StatelessWidget {
  const ECMHeroCarouselCategories({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

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
        items: categories.map((d) => ECMHeroCard(category: d)).toList(),
      ),
    );
  }
}
