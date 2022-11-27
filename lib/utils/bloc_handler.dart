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
  ];

  final List<BlocProvider> blocProviders = [
    BlocProvider<WishlistBloc>(
      create: (ctx) => WishlistBloc()..add(FetchWishlistEvent()),
    ),
    BlocProvider<CartBloc>(
      create: (ctx) => CartBloc()..add(FetchCartItemsEvent()),
    ),
    BlocProvider<CategoryBloc>(
      create: (ctx) => CategoryBloc(
        categoryRepository: ctx.read<CategoryRepository>(),
      )..add(FetchCategoriesEvent()),
    ),
    BlocProvider<ProductBloc>(
      create: (ctx) => ProductBloc(
        productRepository: ctx.read<ProductRepository>(),
      )..add(FetchProductsEvent()),
    ),
  ];
}
