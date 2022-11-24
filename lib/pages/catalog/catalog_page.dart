import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CatalogPage extends StatelessWidget {
  static const id = '/catalog';

  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'Catalog'),
      ),
      bottomNavigationBar: ECMBottomAppBar(),
      body: Center(
        child: Text('ECOMMERCE APP'),
      ),
    );
  }
}
