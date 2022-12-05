import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_bloc_ecommerce/models/models.dart';
import 'package:pay/pay.dart';

import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

class SelectPaymentMethodPage extends StatelessWidget {
  static const id = '/select-payment-method';

  const SelectPaymentMethodPage({super.key});

  void _selectPaymentMethod(BuildContext ctx, PaymentMethod method) {
    ctx.read<PaymentBloc>().add(SelectPaymentMethod(paymentMethod: method));
    Navigator.pop(ctx);
  }

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
        child: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (ctx, state) {
            if (state is PaymentLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (Platform.isIOS)
                  RawApplePayButton(
                    style: ApplePayButtonStyle.black,
                    type: ApplePayButtonType.inStore,
                    onPressed: () => _selectPaymentMethod(
                      context,
                      PaymentMethod.applePay,
                    ),
                  ),
                const SizedBox(height: 10),
                if (Platform.isAndroid)
                  RawGooglePayButton(
                    type: GooglePayButtonType.subscribe,
                    onPressed: () => _selectPaymentMethod(
                      context,
                      PaymentMethod.googlePay,
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    ctx.read<PaymentBloc>().add(const SelectPaymentMethod(
                        paymentMethod: PaymentMethod.creditCard));
                    Navigator.pop(ctx);
                  },
                  child: const Text('Pay with Credit Card'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
