import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';
import '../../../utils/utils.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

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

  void _signin() {
    final form = _formKey.currentState;

    setState(() => _autovalidateMode = AutovalidateMode.always);

    if (form == null || !form.validate()) return;

    form.save();

    debugPrint(_firstName);
    debugPrint(_lastName);
    debugPrint(_city);
    debugPrint(_country);
    debugPrint(_zipCode);
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
          ECMButton(
            labelText: 'Sign Up',
            onPressed: _signin,
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
