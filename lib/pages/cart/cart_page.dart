import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CartPage extends StatelessWidget {
  static const id = '/cart';

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'Cart'),
      ),
      bottomNavigationBar: ECMBottomAppBar(),
      body: Center(
        child: Text('ECOMMERCE APP'),
      ),
    );
  }
}
