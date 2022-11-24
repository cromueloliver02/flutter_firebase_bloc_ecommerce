import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const id = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'Zero To Unicorn'),
      ),
      bottomNavigationBar: const ECMBottomAppBar(),
      body: Column(
        children: [
          const ECMHeroCarousel(),
          const ECMSectionTitle(title: 'RECOMMENDED'),
          ECMProductCarousel(
            products: Product.products.where((d) => d.isRecommended).toList(),
          ),
          const ECMSectionTitle(title: 'MOST POPULAR'),
          ECMProductCarousel(
            products: Product.products.where((d) => d.isPopular).toList(),
          ),
        ],
      ),
    );
  }
}
