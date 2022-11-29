import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'components/checkout_page_form.dart';

class CheckoutPage extends StatelessWidget {
  static const id = '/checkout';

  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'Checkout'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: SingleChildScrollView(
          child: CheckoutPageForm(),
        ),
      ),
    );
  }
}
