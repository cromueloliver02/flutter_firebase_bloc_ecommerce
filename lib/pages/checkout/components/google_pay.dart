import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../../../models/models.dart';

class GooglePay extends StatelessWidget {
  const GooglePay({
    super.key,
    required this.products,
    required this.total,
    required this.deliveryFee,
  });

  final List<Product> products;
  final String total;
  final String deliveryFee;

  void _onGooglePayResult(Map<String, dynamic> map) {
    if (kDebugMode) print(map);
  }

  @override
  Widget build(BuildContext context) {
    final paymentItems = products
        .map((d) => PaymentItem(
              label: d.name,
              amount: d.price.toString(),
              type: PaymentItemType.item,
              status: PaymentItemStatus.final_price,
            ))
        .toList();

    paymentItems.addAll([
      PaymentItem(
        label: 'Shipping Fee',
        amount: deliveryFee,
        type: PaymentItemType.item,
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        label: 'Total',
        amount: total,
        type: PaymentItemType.total,
        status: PaymentItemStatus.final_price,
      ),
    ]);

    return GooglePayButton(
      paymentConfigurationAsset: 'payment_profile_google_pay.json',
      onPaymentResult: _onGooglePayResult,
      type: GooglePayButtonType.pay,
      loadingIndicator: const CircularProgressIndicator(),
      paymentItems: paymentItems,
    );
  }
}
