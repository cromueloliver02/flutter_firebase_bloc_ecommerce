import 'package:flutter/cupertino.dart';

import '../../../models/models.dart';
import '../../../blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import '../../../utils/utils.dart';

class CartProductList extends StatelessWidget {
  const CartProductList({super.key});

  void _cartListener(BuildContext ctx, CartState state) {
    if (state.status == CartStatus.error) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocConsumer<CartBloc, CartState>(
      listener: _cartListener,
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
            itemBuilder: (ctx, idx) => ECMProductCard.cart(
              product: cartMap.keys.elementAt(idx),
              quantity: cartMap.values.elementAt(idx),
            ),
          ),
        );
      },
    );
  }
}
