import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';
import './base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore firestore;

  UserRepository({
    required this.firestore,
  });

  @override
  Stream<User> getUser(String id) {
    return firestore
        .collection(kUserCollectionName)
        .doc(id)
        .snapshots()
        .map((doc) => User.fromDoc(doc));
  }
}
