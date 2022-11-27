import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/pages.dart';
import 'utils/utils.dart';

class EcommerceApp extends StatelessWidget {
  EcommerceApp({super.key});

  final _blocHandler = BlocHandler();
  final _routeHandler = RouteHandler();
  final _themeHandler = ThemeHandler();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocHandler.blocProviders,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: _themeHandler.theme,
        initialRoute: SplashPage.id,
        routes: _routeHandler.routes,
        onGenerateRoute: _routeHandler.onGenerateRoute,
      ),
    );
  }
}
