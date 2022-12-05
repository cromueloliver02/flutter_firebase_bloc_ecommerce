import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_bloc_ecommerce/models/models.dart';
import 'package:validators/validators.dart';

import '../../../blocs/blocs.dart';
import '../../../widgets/widgets.dart';
import '../../../pages/pages.dart';
import '../../../utils/utils.dart';
import './apple_pay.dart';
import './google_pay.dart';
import './select_payment_method_button.dart';

class CheckoutPageForm extends StatefulWidget {
  const CheckoutPageForm({super.key});

  @override
  State<CheckoutPageForm> createState() => _CheckoutPageFormState();
}

class _CheckoutPageFormState extends State<CheckoutPageForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  void _confirmCheckout(BuildContext ctx) {
    final FormState? form = _formKey.currentState;

    setState(() => _autovalidateMode = AutovalidateMode.always);

    if (form != null && form.validate()) {
      // ctx.read<CheckoutBloc>().add(ConfirmCheckoutEvent());

      Navigator.pushNamed(context, OrderConfirmationPage.id);
    }
  }

  void _checkoutListener(BuildContext ctx, CheckoutState state) {
    if (state.status == CheckoutStatus.error) {
      showErrorDialog(ctx, state.error);
    }
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This is required';
    }

    if (!isEmail(value)) return 'Invalid email';

    return null;
  }

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) return 'This is required';

    if (value.trim().length < 6) {
      return 'Should be at least 6 characters long';
    }

    return null;
  }

  String? _zipCodeValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'This is required';

    if (!isNumeric(value) || value.trim().length != 4) {
      return 'Invalid zip code';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        BlocSelector<CheckoutBloc, CheckoutState, CheckoutStatus>(
          selector: (state) => state.status,
          builder: (ctx, status) {
            final enabled = status != CheckoutStatus.submitting;

            return Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'CUSTOMER INFORMATION',
                    style: textTheme.headline3,
                  ),
                  ECMTextFormField(
                    label: 'Email',
                    enabled: enabled,
                    onChanged: (value) => context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckoutEvent(email: value)),
                    validator: _emailValidator,
                  ),
                  const SizedBox(height: 5),
                  ECMTextFormField(
                    label: 'Full Name',
                    enabled: enabled,
                    onChanged: (value) => context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckoutEvent(fullName: value)),
                    validator: _validator,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'DELIVERY INFORMATION',
                    style: textTheme.headline3,
                  ),
                  ECMTextFormField(
                    label: 'Address',
                    enabled: enabled,
                    onChanged: (value) => context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckoutEvent(address: value)),
                    validator: _validator,
                  ),
                  const SizedBox(height: 5),
                  ECMTextFormField(
                    label: 'City',
                    enabled: enabled,
                    onChanged: (value) => context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckoutEvent(city: value)),
                    validator: _validator,
                  ),
                  const SizedBox(height: 5),
                  ECMTextFormField(
                    label: 'Country',
                    enabled: enabled,
                    onChanged: (value) => context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckoutEvent(country: value)),
                    validator: _validator,
                  ),
                  const SizedBox(height: 5),
                  ECMTextFormField(
                    label: 'Zip Code',
                    enabled: enabled,
                    onChanged: (value) => context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckoutEvent(zipCode: value)),
                    validator: _zipCodeValidator,
                  ),
                  const SizedBox(height: 25),
                  const SelectPaymentMethodButton(),
                  const SizedBox(height: 25),
                  Text(
                    'ORDER SUMMARY',
                    style: textTheme.headline3,
                  ),
                  const ECMOrderSummary(),
                  const SizedBox(height: 20),
                  BlocConsumer<CheckoutBloc, CheckoutState>(
                    listener: _checkoutListener,
                    builder: (ctx, state) {
                      // final status = state.status;

                      if (Platform.isIOS) {
                        switch (state.checkout.paymentMethod) {
                          case PaymentMethod.creditCard:
                            return Container(
                              color: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              child: Text(
                                'Pay with Credit Card',
                                style: textTheme.headline4!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          case PaymentMethod.applePay:
                          default:
                            return ApplePay(
                              products: state.checkout.products,
                              total: state.checkout.total,
                              deliveryFee: state.checkout.deliveryFee,
                            );
                        }
                      }

                      if (Platform.isAndroid) {
                        switch (state.checkout.paymentMethod) {
                          case PaymentMethod.creditCard:
                            return Container(
                              color: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              child: Text(
                                'Pay with Credit Card',
                                style: textTheme.headline4!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          case PaymentMethod.applePay:
                          default:
                            return GooglePay(
                              products: state.checkout.products,
                              total: state.checkout.total,
                              deliveryFee: state.checkout.deliveryFee,
                            );
                        }
                      }

                      return ElevatedButton(
                        onPressed: status == CheckoutStatus.submitting
                            ? null
                            : () => _confirmCheckout(ctx),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          disabledBackgroundColor: Colors.black12,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        child: Text(
                          status == CheckoutStatus.submitting
                              ? 'SUBMITTING...'
                              : 'ORDER NOW',
                          style: textTheme.headline3!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
