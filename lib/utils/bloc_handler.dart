import 'package:cloud_firestore/cloud_firestore.dart';

import '../repositories/repositories.dart';
import '../blocs/blocs.dart';

class BlocHandler {
  final List<RepositoryProvider> repositoryProviders = [
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
