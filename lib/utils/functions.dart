import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:validators/validators.dart';

import '../models/custom_error_model.dart';

void showErrorDialog(BuildContext ctx, CustomError err) {
  final textTheme = Theme.of(ctx).textTheme;

  if (Platform.isIOS) {
    showCupertinoDialog(
      context: ctx,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(
          err.code,
          style: textTheme.headline3,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(err.plugin, style: textTheme.bodyText1),
            const SizedBox(height: 10),
            Text(err.message, style: textTheme.bodyText1),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  if (Platform.isAndroid) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text(
          err.code,
          style: textTheme.headline3,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(err.plugin, style: textTheme.bodyText1),
            const SizedBox(height: 10),
            Text(err.message, style: textTheme.bodyText1),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}

String? emailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
  }

  if (!isEmail(value)) {
    return 'Email is invalid';
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Password is required';
  }

  if (value.trim().length < 4) {
    return 'Password should be at least 4 characters long';
  }

  return null;
}

String? firstNameValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'First name is required';
  }

  if (value.trim().length < 4) {
    return 'First name should be at least 4 characters long';
  }

  return null;
}

String? lastNameValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Last name is required';
  }

  if (value.trim().length < 4) {
    return 'Last name should be at least 4 characters long';
  }

  return null;
}

String? cityValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'City is required';
  }

  if (value.trim().length < 4) {
    return 'City should be at least 4 characters long';
  }

  return null;
}

String? countryValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Country is required';
  }

  if (value.trim().length < 4) {
    return 'Country should be at least 4 characters long';
  }

  return null;
}

String? zipCodeValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Zip code is required';
  }

  if (value.trim().length != 4 || !isNumeric(value)) {
    return 'Invalid zip code';
  }

  return null;
}

String? confirmPasswordValidator(
  TextEditingController controller,
  String? value,
) {
  if (value == null || value.trim().isEmpty) {
    return 'Confirm password is required';
  }

  if (value != controller.text) {
    return 'Passwords does not match';
  }

  return null;
}
