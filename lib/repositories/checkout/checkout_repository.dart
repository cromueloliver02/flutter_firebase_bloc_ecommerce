import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_checkout_repository.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore firebaseFirestore;

  CheckoutRepository({
    required this.firebaseFirestore,
  });

  @override
  Future<void> addCheckout(Checkout checkout) async {
    try {
      await firebaseFirestore
          .collection(kCheckoutCollectionName)
          .add(checkout.toMap());
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
