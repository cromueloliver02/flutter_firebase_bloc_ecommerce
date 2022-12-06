import 'package:flutter/material.dart';

import '../../../cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../utils/utils.dart';

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

  void _signin(BuildContext ctx) {
    final form = _formKey.currentState;

    setState(() => _autovalidateMode = AutovalidateMode.always);

    if (form == null || !form.validate()) return;

    form.save();

    debugPrint(_email);
    debugPrint(_password);

    ctx.read<SignInCubit>().signIn(_email!, _password!);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 100),
          ECMSignTextFormField(
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: emailValidator,
            onSaved: (value) => _email = value!,
          ),
          const SizedBox(height: 15),
          ECMSignTextFormField(
            hintText: 'Password',
            obscureText: true,
            validator: passwordValidator,
            onSaved: (value) => _password = value!,
          ),
          const SizedBox(height: 30),
          BlocConsumer<SignInCubit, SignInState>(
            listener: (ctx, state) {
              if (state.status == SignInStatus.error) {
                showErrorDialog(ctx, state.error);
              }
            },
            builder: (ctx, state) {
              return ECMButton(
                labelText: 'Sign In',
                onPressed: state.status == SignInStatus.submitting
                    ? null
                    : () => _signin(context),
              );
            },
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
