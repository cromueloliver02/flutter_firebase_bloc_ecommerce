import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuthRepository {
  Stream<User?> get user;

  void signIn(String email, String password);

  void signOut();
}
