import 'package:flutter/material.dart';
import 'package:flutter_firebase_bloc_ecommerce/pages/select_payment_method/select_payment_method_page.dart';

class SelectPaymentMethodButton extends StatelessWidget {
  const SelectPaymentMethodButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, SelectPaymentMethodPage.id),
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SELECT A PAYMENT METHOD',
              style: textTheme.headline4!.copyWith(
                color: Colors.white,
              ),
            ),
            const Icon(
              Icons.arrow_circle_right_rounded,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
