import 'package:hive/hive.dart';

import '../../models/models.dart';

abstract class BaseLocalStorageRepository {
  Future<Box> openBox(String boxName);
  List<Product> getWishlist(Box<Product> box);
  Future<void> addProductToWishlist(Box<Product> box, Product product);
  Future<void> removeProductFromWishlist(Box<Product> box, Product product);
  Future<void> clearWishlist(Box<Product> box);
}
