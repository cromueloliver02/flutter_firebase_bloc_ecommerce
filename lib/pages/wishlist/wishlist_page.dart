import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';
import '../../utils/utils.dart';

class WishlistPage extends StatelessWidget {
  static const id = '/wishlist';

  const WishlistPage({super.key});

  void _wishlistListener(BuildContext ctx, WishlistState state) {
    if (state.status == WishlistStatus.error) {
      showErrorDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'Wishlist'),
      ),
      bottomNavigationBar: const ECMBottomAppBar(),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        listener: _wishlistListener,
        builder: (ctx, state) {
          final WishlistStatus status = state.status;

          if (status == WishlistStatus.initial) {
            return const SizedBox.shrink();
          }

          if (status == WishlistStatus.loading) {
            return const ECMLoading();
          }

          if (status == WishlistStatus.error) {
            return const ECMErrorMessage();
          }

          final List<Product> wishlistProducts = state.wishlist.products;

          return GridView.builder(
            // I don't know why gridview instead of listview
            itemCount: wishlistProducts.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2.5,
            ),
            itemBuilder: (ctx, idx) => Center(
              child: ECMProductCard.wishlist(
                product: wishlistProducts[idx],
              ),
            ),
          );
        },
      ),
    );
  }
}
