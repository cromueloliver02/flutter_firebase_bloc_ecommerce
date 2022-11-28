import 'package:flutter/material.dart';

import '../../../blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import '../../../utils/utils.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  void _productListener(BuildContext ctx, ProductState state) {
    if (state.status == ProductStatus.error) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ECMSectionTitle(title: 'RECOMMENDED'),
        BlocConsumer<ProductBloc, ProductState>(
          listener: _productListener,
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
              products: products.where((d) => d.isRecommended).toList(),
            );
          },
        ),
      ],
    );
  }
}
