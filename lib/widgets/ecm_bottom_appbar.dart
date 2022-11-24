import 'package:flutter/material.dart';

import '../pages/pages.dart';

class ECMBottomAppBar extends StatelessWidget {
  const ECMBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => Navigator.pushNamed(context, HomePage.id),
                color: Colors.white,
                icon: const Icon(Icons.home),
              ),
              IconButton(
                onPressed: () => Navigator.pushNamed(context, CartPage.id),
                color: Colors.white,
                icon: const Icon(Icons.shopping_cart),
              ),
              IconButton(
                onPressed: () => Navigator.pushNamed(context, UserPage.id),
                color: Colors.white,
                icon: const Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
