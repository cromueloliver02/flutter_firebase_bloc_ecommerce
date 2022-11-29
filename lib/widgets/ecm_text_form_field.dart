import 'package:flutter/material.dart';

class ECMTextFormField extends StatelessWidget {
  const ECMTextFormField({
    super.key,
    required this.label,
    required this.onChanged,
    this.validator,
    this.enabled = true,
    this.autocorrect = false,
  });

  final String label;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool autocorrect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        enabled: enabled,
        autocorrect: autocorrect,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          isDense: true,
          label: Text(
            label,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          contentPadding: const EdgeInsets.only(left: 10),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
