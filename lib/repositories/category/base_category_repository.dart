import '../../models/models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> fetchAllCategories();
}
