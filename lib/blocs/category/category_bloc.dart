import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart' as models;
import '../../repositories/repositories.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  late final StreamSubscription _categorySubscription;
  final CategoryRepository categoryRepository;

  CategoryBloc({
    required this.categoryRepository,
  }) : super(CategoryState.initial()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<UpdateCategoriesEvent>(_onUpdateCategories);
  }

  @override
  Future<void> close() {
    _categorySubscription.cancel();
    return super.close();
  }

  void _onLoadCategories(
    LoadCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) {
    emit(state.copyWith(status: CategoryStatus.loading));

    try {
      _categorySubscription =
          categoryRepository.loadCategories().listen((categories) {
        add(UpdateCategoriesEvent(categories: categories));
      });

      emit(state.copyWith(status: CategoryStatus.loaded));
    } on models.CustomError catch (err) {
      emit(state.copyWith(
        status: CategoryStatus.error,
        error: err,
      ));

      if (kDebugMode) print('Error: state $state');
    }
  }

  void _onUpdateCategories(
    UpdateCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) {
    emit(state.copyWith(categories: event.categories));
  }
}
