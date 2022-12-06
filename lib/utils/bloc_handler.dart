import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../repositories/repositories.dart';
import '../blocs/blocs.dart';
import '../cubits/cubits.dart';

class BlocHandler {
  final List<RepositoryProvider> repositoryProviders = [
    RepositoryProvider<AuthRepository>(
      create: (ctx) => AuthRepository(
        auth: FirebaseAuth.instance,
        firestore: FirebaseFirestore.instance,
      ),
    ),
    RepositoryProvider<CategoryRepository>(
      create: (ctx) => CategoryRepository(
        firebaseFirestore: FirebaseFirestore.instance,
      ),
    ),
    RepositoryProvider<ProductRepository>(
      create: (ctx) => ProductRepository(
        firebaseFirestore: FirebaseFirestore.instance,
      ),
    ),
    RepositoryProvider<CheckoutRepository>(
      create: (ctx) => CheckoutRepository(
        firebaseFirestore: FirebaseFirestore.instance,
      ),
    ),
    RepositoryProvider<LocalStorageRepository>(
      create: (ctx) => LocalStorageRepository(),
    ),
  ];

  final List<BlocProvider> blocProviders = [
    BlocProvider<AuthBloc>(
      create: (ctx) => AuthBloc(
        authRepository: ctx.read<AuthRepository>(),
      )..add(InitializeAuthEvent()),
    ),
    BlocProvider<SignInCubit>(
      create: (ctx) => SignInCubit(
        authRepository: ctx.read<AuthRepository>(),
      ),
    ),
    BlocProvider<SignUpCubit>(
      create: (ctx) => SignUpCubit(
        authRepository: ctx.read<AuthRepository>(),
      ),
    ),
    BlocProvider<WishlistBloc>(
      create: (ctx) => WishlistBloc(
        localStorageRepository: ctx.read<LocalStorageRepository>(),
      )..add(LoadWishlistEvent()),
    ),
    BlocProvider<CartBloc>(
      create: (ctx) => CartBloc()..add(LoadCartItemsEvent()),
    ),
    BlocProvider<PaymentBloc>(
      lazy: false,
      create: (ctx) => PaymentBloc()..add(LoadPaymentMethod()),
    ),
    BlocProvider<CheckoutBloc>(
      lazy: false,
      create: (ctx) => CheckoutBloc(
        cartBloc: ctx.read<CartBloc>(),
        paymentBloc: ctx.read<PaymentBloc>(),
        checkoutRepository: ctx.read<CheckoutRepository>(),
      ),
    ),
    BlocProvider<CategoryBloc>(
      create: (ctx) => CategoryBloc(
        categoryRepository: ctx.read<CategoryRepository>(),
      )..add(LoadCategoriesEvent()),
    ),
    BlocProvider<ProductBloc>(
      create: (ctx) => ProductBloc(
        productRepository: ctx.read<ProductRepository>(),
      )..add(LoadProductsEvent()),
    ),
  ];
}
