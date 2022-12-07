import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuthRepository {
  Stream<User?> get user;

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String city,
    required String country,
    required int zipCode,
    required String email,
    required String password,
  });

  void signOut();
}
