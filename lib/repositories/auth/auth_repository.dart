import 'package:firebase_auth/firebase_auth.dart';

import './base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final FirebaseAuth auth;

  AuthRepository({
    required this.auth,
  });

  @override
  Stream<User?> get user => auth.userChanges();

  @override
  void signOut() => auth.signOut();
}
