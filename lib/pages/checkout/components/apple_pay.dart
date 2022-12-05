import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../../../models/models.dart';

class ApplePay extends StatelessWidget {
  const ApplePay({
    super.key,
    required this.products,
    required this.total,
    required this.deliveryFee,
  });

  final List<Product> products;
  final String total;
  final String deliveryFee;

  void _onApplePayResult(Map<String, dynamic> map) {}

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

    return ApplePayButton(
      paymentConfigurationAsset: 'payment_profile_apple_pay.json',
      onPaymentResult: _onApplePayResult,
      style: ApplePayButtonStyle.black,
      type: ApplePayButtonType.inStore,
      loadingIndicator: const CircularProgressIndicator(),
      paymentItems: paymentItems,
    );
  }
}
