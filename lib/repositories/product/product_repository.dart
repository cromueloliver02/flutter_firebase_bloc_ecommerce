import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';
import 'base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore firebaseFirestore;

  ProductRepository({
    required this.firebaseFirestore,
  });

  @override
  Stream<List<Product>> fetchAllProducts() {
    try {
      return firebaseFirestore
          .collection(kProductCollectionName)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return Product.fromSnapshot(doc);
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
