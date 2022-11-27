part of 'product_bloc.dart';

class ProductState extends Equatable {
  final ProductStatus status;
  final List<Product> products;
  final CustomError error;

  const ProductState({
    required this.status,
    required this.products,
    required this.error,
  });

  factory ProductState.initial() {
    return const ProductState(
      status: ProductStatus.initial,
      products: <Product>[],
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [status, products, error];

  @override
  String toString() =>
      'ProductState(status: $status, products: $products, error: $error)';

  ProductState copyWith({
    ProductStatus? status,
    List<Product>? products,
    CustomError? error,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      error: error ?? this.error,
    );
  }
}

enum ProductStatus {
  initial,
  loading,
  loaded,
  error,
}
