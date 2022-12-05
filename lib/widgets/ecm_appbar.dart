import 'package:flutter/material.dart';

import '../pages/pages.dart';

class ECMAppBar extends StatelessWidget {
  const ECMAppBar({
    super.key,
    required this.title,
    this.showWishlistButton = true,
    this.automaticallyImplyLeading = true,
  });

  final String title;
  final bool showWishlistButton;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: Colors.transparent,
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        if (showWishlistButton)
          IconButton(
            onPressed: () => Navigator.pushNamed(context, WishlistPage.id),
            icon: const Icon(Icons.favorite),
          ),
      ],
    );
  }
}
