import 'package:flutter/material.dart';

import 'pages/pages.dart';
import 'utils/utils.dart';

class EcommerceApp extends StatelessWidget {
  EcommerceApp({super.key});

  final _routeHandler = RouteHandler();
  final _themeHandler = ThemeHandler();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: _themeHandler.theme,
      initialRoute: HomePage.id,
      routes: _routeHandler.routes,
      onGenerateRoute: _routeHandler.onGenerateRoute,
    );
  }
}
