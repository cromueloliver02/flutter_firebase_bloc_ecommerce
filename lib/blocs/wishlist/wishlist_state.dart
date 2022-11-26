part of 'wishlist_bloc.dart';

class WishlistState extends Equatable {
  final WishlistStatus status;
  final Wishlist wishlist;
  final CustomError error;

  const WishlistState({
    required this.status,
    required this.wishlist,
    required this.error,
  });

  factory WishlistState.initial() {
    return const WishlistState(
      status: WishlistStatus.initial,
      wishlist: Wishlist(),
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [status, wishlist, error];

  @override
  String toString() =>
      'WishlistState(status: $status, wishlist: $wishlist, error: $error)';

  WishlistState copyWith({
    WishlistStatus? status,
    Wishlist? wishlist,
    CustomError? error,
  }) {
    return WishlistState(
      status: status ?? this.status,
      wishlist: wishlist ?? this.wishlist,
      error: error ?? this.error,
    );
  }
}

enum WishlistStatus {
  initial,
  loading,
  loaded,
  error,
}
