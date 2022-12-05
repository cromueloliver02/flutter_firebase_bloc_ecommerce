import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../../widgets/widgets.dart';

class SelectPaymentMethodPage extends StatelessWidget {
  static const id = '/select-payment-method';

  const SelectPaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(
          title: 'Select Payment',
          showWishlistButton: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (Platform.isIOS)
              RawApplePayButton(
                style: ApplePayButtonStyle.black,
                type: ApplePayButtonType.inStore,
                onPressed: () {},
              ),
            const SizedBox(height: 10),
            if (Platform.isAndroid)
              RawGooglePayButton(
                type: GooglePayButtonType.subscribe,
                onPressed: () {},
              ),
          ],
        ),
      ),
    );
  }
}
