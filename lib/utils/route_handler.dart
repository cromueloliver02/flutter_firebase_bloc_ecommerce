import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../models/models.dart' as models;
import '../pages/pages.dart';

class RouteHandler {
  final Map<String, WidgetBuilder> routes = {
    SplashPage.id: (ctx) => const SplashPage(),
    HomePage.id: (ctx) => const HomePage(),
    CartPage.id: (ctx) => const CartPage(),
    UserPage.id: (ctx) => const UserPage(),
    WishlistPage.id: (ctx) => const WishlistPage(),
    CheckoutPage.id: (ctx) => const CheckoutPage(),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) print('route id: ${settings.name}');

    switch (settings.name) {
      case CatalogPage.id:
        final models.Category category = settings.arguments as models.Category;
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => CatalogPage(category: category),
        );

      case ProductPage.id:
        final models.Product product = settings.arguments as models.Product;
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => ProductPage(product: product),
        );

      default:
        return null;
    }
  }

  Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => const NotFoundPage(),
    );
  }
}
