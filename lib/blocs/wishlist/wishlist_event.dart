part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class FetchWishlistEvent extends WishlistEvent {}

class AddWishlistEvent extends WishlistEvent {
  final Product product;

  const AddWishlistEvent({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

class RemoveWishlistEvent extends WishlistEvent {
  final Product product;

  const RemoveWishlistEvent({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}
