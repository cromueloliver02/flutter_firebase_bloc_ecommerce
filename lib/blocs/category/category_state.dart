part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final CategoryStatus status;
  final List<models.Category> categories;
  final models.CustomError error;

  const CategoryState({
    required this.status,
    required this.categories,
    required this.error,
  });

  factory CategoryState.initial() {
    return const CategoryState(
      status: CategoryStatus.initial,
      categories: <models.Category>[],
      error: models.CustomError(),
    );
  }

  @override
  List<Object> get props => [status, categories, error];

  @override
  String toString() =>
      'CategoryState(status: $status, categories: $categories, error: $error)';

  CategoryState copyWith({
    CategoryStatus? status,
    List<models.Category>? categories,
    models.CustomError? error,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      error: error ?? this.error,
    );
  }
}

enum CategoryStatus {
  initial,
  loading,
  loaded,
  error,
}
