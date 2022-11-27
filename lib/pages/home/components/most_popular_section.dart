import 'package:flutter/material.dart';

import '../../../blocs/blocs.dart';
import '../../../widgets/widgets.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ECMSectionTitle(title: 'MOST POPULAR'),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (ctx, state) {
            final ProductStatus status = state.status;

            if (status == ProductStatus.initial) {
              return const SizedBox.shrink();
            }

            if (status == ProductStatus.loading) {
              return const SizedBox(
                height: 165,
                child: ECMLoading(),
              );
            }

            if (status == ProductStatus.error) {
              return const SizedBox(
                height: 165,
                child: ECMErrorMessage(),
              );
            }

            final products = state.products;

            return ECMProductCarousel(
              products: products.where((d) => d.isPopular).toList(),
            );
          },
        ),
      ],
    );
  }
}
