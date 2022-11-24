import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ProductPage extends StatelessWidget {
  static const id = '/product';

  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'Product'),
      ),
      bottomNavigationBar: ECMBottomAppBar(),
      body: Center(
        child: Text('ECOMMERCE APP'),
      ),
    );
  }
}
