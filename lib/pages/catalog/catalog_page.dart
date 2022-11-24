import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class CatalogPage extends StatelessWidget {
  static const id = '/catalog';

  const CatalogPage({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProds =
        Product.products.where((d) => d.category == category.name).toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ECMAppBar(title: category.name),
      ),
      bottomNavigationBar: const ECMBottomAppBar(),
      body: GridView.builder(
        itemCount: categoryProds.length,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.15,
        ),
        itemBuilder: (ctx, idx) => Center(
          child: ECMProductCard(
            product: categoryProds[idx],
            widthFactor: 2.2,
          ),
        ),
      ),
    );
  }
}
