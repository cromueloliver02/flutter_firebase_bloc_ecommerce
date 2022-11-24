import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class WishlistPage extends StatelessWidget {
  static const id = '/wishlist';

  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'Wishlist'),
      ),
      bottomNavigationBar: ECMBottomAppBar(),
      body: Center(
        child: Text('ECOMMERCE APP'),
      ),
    );
  }
}
