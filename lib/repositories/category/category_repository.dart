import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';
import 'base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore firebaseFirestore;

  CategoryRepository({
    required this.firebaseFirestore,
  });

  @override
  Stream<List<Category>> loadCategories() {
    try {
      return firebaseFirestore
          .collection(kCategoryCollectionName)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return Category.fromSnapshot(doc);
        }).toList();
      });
    } on FirebaseException catch (err) {
      throw CustomError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw CustomError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
