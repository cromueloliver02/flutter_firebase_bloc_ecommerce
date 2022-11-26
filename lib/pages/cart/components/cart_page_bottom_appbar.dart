import 'package:flutter/material.dart';

class CartPageBottomAppBar extends StatelessWidget {
  const CartPageBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(top: 10),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                'GO TO CHECKOUT',
                style: textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
