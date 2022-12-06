import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../../../widgets/widgets.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? _email, _password;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    if (!isEmail(value)) {
      return 'Email is invalid';
    }

    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    if (value.trim().length < 6) {
      return 'Password should be at least 6 characters long';
    }

    return null;
  }

  void _signin() {
    final form = _formKey.currentState;

    setState(() => _autovalidateMode = AutovalidateMode.always);

    if (form == null || !form.validate()) return;

    form.save();

    debugPrint(_email);
    debugPrint(_password);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ECMSignTextFormField(
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: _emailValidator,
            onSaved: (value) => _email = value!,
          ),
          const SizedBox(height: 15),
          ECMSignTextFormField(
            hintText: 'Password',
            obscureText: true,
            validator: _passwordValidator,
            onSaved: (value) => _password = value!,
          ),
          const SizedBox(height: 30),
          ECMButton(
            labelText: 'Sign In',
            onPressed: _signin,
          ),
          const SizedBox(height: 5),
          ECMButton(
            labelText: 'Sign In with Google',
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
