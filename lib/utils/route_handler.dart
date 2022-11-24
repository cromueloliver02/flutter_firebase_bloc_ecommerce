import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../models/models.dart' as models;
import '../pages/pages.dart';

class RouteHandler {
  final Map<String, WidgetBuilder> routes = {
    HomePage.id: (ctx) => const HomePage(),
    CartPage.id: (ctx) => const CartPage(),
    UserPage.id: (ctx) => const UserPage(),
    WishlistPage.id: (ctx) => const WishlistPage(),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) print('route id: ${settings.name}');

    switch (settings.name) {
      case CatalogPage.id:
        final category = settings.arguments as models.Category;
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => CatalogPage(category: category),
        );

      case ProductPage.id:
        final product = settings.arguments as models.Product;
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => ProductPage(product: product),
        );

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
