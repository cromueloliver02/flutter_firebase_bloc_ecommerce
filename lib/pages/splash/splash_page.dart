import 'package:flutter/material.dart';

import '../../blocs/blocs.dart';
import '../../pages/pages.dart';

class SplashPage extends StatelessWidget {
  static const id = '/splash';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (ctx, state) {
        if (state.status == AuthStatus.unauthenticated) {
          Navigator.pushNamedAndRemoveUntil(
            ctx,
            SignInPage.id,
            (route) => route.settings.name == ModalRoute.of(ctx)!.settings.name,
          );
        }

        if (state.status == AuthStatus.authenticated) {
          Navigator.pushNamed(
            ctx,
            HomePage.id,
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 125,
                height: 125,
              ),
              const SizedBox(height: 30),
              Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Text(
                  'Zero To Unicorn',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
