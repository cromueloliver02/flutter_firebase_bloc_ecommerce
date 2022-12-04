import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../repositories/repositories.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  late final StreamSubscription _productSubscription;
  final ProductRepository productRepository;

  ProductBloc({
    required this.productRepository,
  }) : super(ProductState.initial()) {
    on<LoadProductsEvent>(_onLoadProducts);
    on<UpdateProductsEvent>(_onUpdateProducts);
  }

  @override
  Future<void> close() {
    _productSubscription.cancel();
    return super.close();
  }

  void _onLoadProducts(LoadProductsEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      _productSubscription = productRepository.loadProducts().listen(
        (List<Product> products) {
          add(UpdateProductsEvent(products: products));
        },
      );

      emit(state.copyWith(status: ProductStatus.loaded));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: ProductStatus.error,
        error: err,
      ));

      if (kDebugMode) print('Error: state $state');
    }
  }

  void _onUpdateProducts(
    UpdateProductsEvent event,
    Emitter<ProductState> emit,
  ) {
    emit(state.copyWith(products: event.products));
  }
}
