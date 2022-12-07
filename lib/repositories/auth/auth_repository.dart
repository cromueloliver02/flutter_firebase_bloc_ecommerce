import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

import '../../models/models.dart';
import '../../utils/utils.dart';
import './base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final fb_auth.FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  @override
  Stream<fb_auth.User?> get user => auth.userChanges();

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
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

  @override
  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String city,
    required String country,
    required int zipCode,
    required String email,
    required String password,
  }) async {
    try {
      final fb_auth.UserCredential credential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final fb_auth.User signedUser = credential.user!;

      await firestore.collection(kUserCollectionName).doc(signedUser.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'city': city,
        'country': country,
        'zipCode': zipCode,
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

  @override
  void signOut() => auth.signOut();
}
