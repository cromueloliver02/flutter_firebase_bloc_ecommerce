import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import 'ecommerce_app.dart';
// import 'utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Bloc.observer = SimpleBlocObserver(); // disable temporarily

  runApp(EcommerceApp());
}
