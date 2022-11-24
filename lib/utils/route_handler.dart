import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../pages/pages.dart';

class RouteHandler {
  final Map<String, WidgetBuilder> routes = {
    HomePage.id: (ctx) => const HomePage(),
    CartPage.id: (ctx) => const CartPage(),
    ProductPage.id: (ctx) => const ProductPage(),
    WishlistPage.id: (ctx) => const WishlistPage(),
    CatalogPage.id: (ctx) => const CatalogPage(),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) print('route id: ${settings.name}');

    switch (settings.name) {
      default:
        return _errorPage(settings);
    }
  }

  static Route _errorPage(RouteSettings settings) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (ctx) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(
          child: Text(
            '404: Page not found',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
