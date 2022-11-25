import 'package:flutter/material.dart';

class ECMLoading extends StatelessWidget {
  const ECMLoading({
    super.key,
    this.message = 'Loading...',
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
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
