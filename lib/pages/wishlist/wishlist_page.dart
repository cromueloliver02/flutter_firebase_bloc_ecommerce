import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

class WishlistPage extends StatelessWidget {
  static const id = '/wishlist';

  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'Wishlist'),
      ),
      bottomNavigationBar: const ECMBottomAppBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
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

          final List<Product> wishlist = state.wishlist;

          return GridView.builder(
            // I don't know why gridview instead of listview
            itemCount: wishlist.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2.5,
            ),
            itemBuilder: (ctx, idx) => Center(
              child: ECMProductCard(
                product: wishlist[idx],
                widthFactor: 1.1,
                leftPosition: 100,
                isWishList: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
