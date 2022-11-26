import '../blocs/blocs.dart';

class BlocHandler {
  final List<BlocProvider> blocProviders = [
    BlocProvider<WishlistBloc>(
      create: (ctx) => WishlistBloc()..add(FetchWishlistEvent()),
    ),
    BlocProvider<CartBloc>(
      create: (ctx) => CartBloc()..add(FetchCartItemsEvent()),
    ),
  ];
}
