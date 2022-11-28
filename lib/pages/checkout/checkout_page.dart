import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'components/checkout_page_bottom_appbar.dart';

class CheckoutPage extends StatelessWidget {
  static const id = '/checkout';

  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'Checkout'),
      ),
      bottomNavigationBar: const CheckoutPageBottomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CUSTOMER INFORMATION',
              style: textTheme.headline3,
            ),
            const ECMTextFormField(label: 'Email'),
            const ECMTextFormField(label: 'Full Name'),
            Text(
              'DELIVERY INFORMATION',
              style: textTheme.headline3,
            ),
            const ECMTextFormField(label: 'Address'),
            const ECMTextFormField(label: 'City'),
            const ECMTextFormField(label: 'Country'),
            const ECMTextFormField(label: 'Zip Code'),
            Text(
              'ORDER SUMMARY',
              style: textTheme.headline3,
            ),
            const ECMOrderSummary(),
          ],
        ),
      ),
    );
  }
}
