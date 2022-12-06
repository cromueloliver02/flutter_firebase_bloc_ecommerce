import 'package:flutter/material.dart';

import '../../blocs/blocs.dart';
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ECMAppBar(title: category.name),
      ),
      bottomNavigationBar: const ECMBottomAppBar(),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (ctx, state) {
          if (state.status == ProductStatus.initial) {
            return const SizedBox.shrink();
          }

          if (state.status == ProductStatus.loading) {
            return const ECMLoading();
          }

          if (state.status == ProductStatus.error) {
            return const ECMErrorMessage();
          }

          final categoryProducts =
              state.products.where((d) => d.category == category.name).toList();

          return GridView.builder(
            itemCount: categoryProducts.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.15,
            ),
            itemBuilder: (ctx, idx) => Center(
              child: ECMProductCard.catalog(
                product: categoryProducts[idx],
              ),
            ),
          );
        },
      ),
    );
  }
}
