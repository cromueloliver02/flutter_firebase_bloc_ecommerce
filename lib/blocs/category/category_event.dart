part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategoriesEvent extends CategoryEvent {}

class UpdateCategoriesEvent extends CategoryEvent {
  final List<models.Category> categories;

  const UpdateCategoriesEvent({
    required this.categories,
  });

  @override
  List<Object> get props => [categories];
}
