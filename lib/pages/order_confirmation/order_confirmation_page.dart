import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/product_model.dart';
import '../../widgets/widgets.dart';
import 'components/order_card.dart';
import 'components/order_confirmation_page_bottom_appbar.dart';

class OrderConfirmationPage extends StatelessWidget {
  static const id = '/order-confirmation';

  const OrderConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: ECMAppBar(
            title: 'Order Confirmation',
            automaticallyImplyLeading: false,
          ),
        ),
        bottomNavigationBar: const OrderConfirmationPageBottomAppBar(),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: 300,
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/svgs/garlands.svg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Your order is complete',
                      style: textTheme.headline3!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ORDER CODE: ksfe-dqwf-fqwq',
                      style: textTheme.headline4,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Thank you for purchasing on Zero To Unicorn',
                      style: textTheme.headline5,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'ORDER CODE: ksfe-dqwf-fqwq',
                      style: textTheme.headline4,
                    ),
                    const ECMOrderSummary(),
                    const SizedBox(height: 20),
                    Text(
                      'ORDER DETAILS',
                      style: textTheme.headline4,
                    ),
                    const Divider(thickness: 2),
                    const SizedBox(height: 5),
                    ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        OrderCard(
                          product: Product.products[0],
                          quantity: 2,
                        ),
                        OrderCard(
                          product: Product.products[2],
                          quantity: 3,
                        ),
                        OrderCard(
                          product: Product.products[3],
                          quantity: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
