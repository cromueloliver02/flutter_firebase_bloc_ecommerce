import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../blocs/blocs.dart';
import '../../../widgets/widgets.dart';

class CartProductList extends StatelessWidget {
  const CartProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocBuilder<CartBloc, CartState>(
      builder: (ctx, state) {
        final CartStatus status = state.status;

        if (status == CartStatus.initial) {
          return const SizedBox.shrink();
        }

        if (status == CartStatus.loading) {
          return SizedBox(
            height: screenSize.height / 2,
            child: const ECMLoading(),
          );
        }

        if (status == CartStatus.error) {
          return SizedBox(
            height: screenSize.height / 2,
            child: const ECMErrorMessage(),
          );
        }

        final Map<Product, int> cartMap =
            state.cart.cartMap(state.cart.products);

        return Expanded(
          child: ListView.separated(
            itemCount: cartMap.length,
            separatorBuilder: (ctx, idx) => const SizedBox(height: 10),
            itemBuilder: (ctx, idx) => ECMCartProductCard(
              product: cartMap.keys.elementAt(idx),
              quantity: cartMap.values.elementAt(idx),
            ),
          ),
        );
      },
    );
  }
}
