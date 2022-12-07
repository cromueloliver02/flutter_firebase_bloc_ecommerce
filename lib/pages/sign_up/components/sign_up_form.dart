import 'package:flutter/material.dart';

import '../../../cubits/cubits.dart';
import '../../../widgets/widgets.dart';
import '../../../utils/utils.dart';
import '../../pages.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignUpForm> {
  late final TextEditingController controller;
  final _formKey = GlobalKey<FormState>();
  String? _firstName, _lastName, _city, _country, _zipCode, _email, _password;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? _confirmPasswordValidator(String? value) {
    return confirmPasswordValidator(controller, value);
  }

  void _signUp(BuildContext ctx) {
    final form = _formKey.currentState;

    setState(() => _autovalidateMode = AutovalidateMode.always);

    if (form == null || !form.validate()) return;

    form.save();

    ctx.read<SignUpCubit>().signUp(
          firstName: _firstName!,
          lastName: _lastName!,
          city: _city!,
          country: _country!,
          zipCode: int.parse(_zipCode!),
          email: _email!,
          password: _password!,
        );
  }

  void _goToSignInPage(BuildContext ctx) {
    Navigator.pushReplacementNamed(ctx, SignInPage.id);
  }

  void _signUpListener(BuildContext ctx, SignUpState state) {
    if (state.status == SignUpStatus.error) {
      showErrorDialog(ctx, state.error);
    }
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
            hintText: 'First Name',
            validator: firstNameValidator,
            onSaved: (value) => _firstName = value!,
          ),
          const SizedBox(height: 15),
          ECMSignTextFormField(
            hintText: 'Last Name',
            validator: lastNameValidator,
            onSaved: (value) => _lastName = value!,
          ),
          const SizedBox(height: 15),
          ECMSignTextFormField(
            hintText: 'City',
            validator: cityValidator,
            onSaved: (value) => _city = value!,
          ),
          const SizedBox(height: 15),
          ECMSignTextFormField(
            hintText: 'Country',
            validator: countryValidator,
            onSaved: (value) => _country = value!,
          ),
          const SizedBox(height: 15),
          ECMSignTextFormField(
            hintText: 'Zip Code',
            keyboardType: TextInputType.number,
            validator: zipCodeValidator,
            onSaved: (value) => _zipCode = value!,
          ),
          const SizedBox(height: 15),
          ECMSignTextFormField(
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: emailValidator,
            onSaved: (value) => _email = value!,
          ),
          const SizedBox(height: 15),
          ECMSignTextFormField(
            controller: controller,
            hintText: 'Password',
            obscureText: true,
            validator: passwordValidator,
            onSaved: (value) => _password = value!,
          ),
          const SizedBox(height: 15),
          ECMSignTextFormField(
            hintText: 'Confirm Password',
            obscureText: true,
            validator: _confirmPasswordValidator,
          ),
          const SizedBox(height: 30),
          BlocConsumer<SignUpCubit, SignUpState>(
            listener: _signUpListener,
            builder: (ctx, state) => ECMButton(
              labelText: 'Sign Up',
              onPressed: state.status == SignUpStatus.submitting
                  ? null
                  : () => _signUp(ctx),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => _goToSignInPage(context),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 10),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('Don\'t have an account yet? Sign in!'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
