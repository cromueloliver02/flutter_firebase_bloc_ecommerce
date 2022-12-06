import 'package:flutter/material.dart';

class ECMSignTextFormField extends StatelessWidget {
  const ECMSignTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSaved,
  });

  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: textTheme.bodyText1!.copyWith(
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.bodyText1!.copyWith(
          color: Colors.grey[700],
          fontSize: 18,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 5,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
