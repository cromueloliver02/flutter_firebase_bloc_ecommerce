import 'package:flutter/material.dart';

class ECMErrorMessage extends StatelessWidget {
  const ECMErrorMessage({
    super.key,
    this.message = 'Something went wrong',
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 40,
          ),
          const SizedBox(height: 20),
          Text(
            message,
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
