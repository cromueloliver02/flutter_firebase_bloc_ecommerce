import 'package:flutter/material.dart';

class ECMButton extends StatelessWidget {
  const ECMButton({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.black,
  });

  final String labelText;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 10),
        textStyle: const TextStyle(fontSize: 20),
      ),
      child: Text(labelText),
    );
  }
}
