import 'package:hive/hive.dart';

import '../../models/models.dart';
import './base_local_storage_repository.dart';

class LocalStorageRepository extends BaseLocalStorageRepository {
  @override
  Future<Box<Product>> openBox(String boxName) async {
    try {
      final Box<Product> box = await Hive.openBox(boxName);

      return box;
    } on HiveError catch (err) {
      throw CustomError(
        code: 'Hive Error',
        message: err.message,
        plugin: 'hive_error',
      );
    } catch (err) {
      throw CustomError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  List<Product> getWishlist(Box<Product> box) {
    return box.values.toList();
  }

  @override
  Future<void> addProductToWishlist(Box<Product> box, Product product) async {
    try {
      await box.put(product.id, product);
    } on HiveError catch (err) {
      throw CustomError(
        code: 'Hive Error',
        message: err.message,
        plugin: 'hive_error',
      );
    } catch (err) {
      throw CustomError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<void> removeProductFromWishlist(
      Box<Product> box, Product product) async {
    try {
      await box.delete(product.id);
    } on HiveError catch (err) {
      throw CustomError(
        code: 'Hive Error',
        message: err.message,
        plugin: 'hive_error',
      );
    } catch (err) {
      throw CustomError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<void> clearWishlist(Box<Product> box) async {
    try {
      await box.clear();
    } on HiveError catch (err) {
      throw CustomError(
        code: 'Hive Error',
        message: err.message,
        plugin: 'hive_error',
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
