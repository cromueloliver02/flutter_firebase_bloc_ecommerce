import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
