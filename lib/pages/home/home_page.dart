import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const id = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'Zero To Unicorn'),
      ),
      bottomNavigationBar: ECMBottomAppBar(),
      body: Center(
        child: Text('ECOMMERCE APP'),
      ),
    );
  }
}
