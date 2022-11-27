import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ecommerce_app.dart';
import 'utils/utils.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(EcommerceApp());
}
