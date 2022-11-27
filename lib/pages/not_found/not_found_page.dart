import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../pages/pages.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  void _goToHomePage(BuildContext ctx) => Navigator.popUntil(
        ctx,
        (route) => route.settings.name == HomePage.id,
      );

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          'ERROR',
          style: textTheme.headline2!.copyWith(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.network(
              width: 200,
              'https://assets5.lottiefiles.com/packages/lf20_GIyuXJ.json',
            ),
            const SizedBox(height: 30),
            Text(
              'Page not found',
              style: textTheme.headline2,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _goToHomePage(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: textTheme.headline4,
              ),
              child: const Text('Go To Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
