part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class FetchCartItemsEvent extends CartEvent {}

class AddCartItemEvent extends CartEvent {
  final Product product;

  const AddCartItemEvent({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

class RemoveCartItemEvent extends CartEvent {
  final Product product;

  const RemoveCartItemEvent({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}
