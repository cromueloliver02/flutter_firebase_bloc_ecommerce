import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import './components/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  static const id = '/sign-up';

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(
          title: 'Sign Up',
          showWishlistButton: false,
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
          child: SignUpForm(),
        ),
      ),
    );
  }
}
