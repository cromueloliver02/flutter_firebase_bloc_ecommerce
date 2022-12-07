import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import './components/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  static const id = '/sign-in';

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: ECMAppBar(
            title: 'Sign In',
            showWishlistButton: false,
            automaticallyImplyLeading: false,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SignInForm(),
          ),
        ),
      ),
    );
  }
}
