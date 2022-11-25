import '../blocs/blocs.dart';

class BlocHandler {
  final List<BlocProvider> blocProviders = [
    BlocProvider<WishlistBloc>(
      create: (ctx) => WishlistBloc()..add(FetchWishlistEvent()),
    ),
  ];
}
