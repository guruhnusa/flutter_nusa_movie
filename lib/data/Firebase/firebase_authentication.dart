import 'package:flutter_nusa_movie/data/repositories/authentication_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;

class FirebaseAuthentication implements AuthenticationRepository {
  final auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthentication({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  String? getLoggedInUserId() {
    return _firebaseAuth.currentUser?.uid;
  }

  @override
  Future<Result<String>> login(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return Result.success(credential.user!.uid);
    } on auth.FirebaseAuthException catch (e) {
      return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<void>> logout() async {
    await _firebaseAuth.signOut();
    if (_firebaseAuth.currentUser == null) {
      return const Result.success(null);
    } else {
      return const Result.failed('Failed to logout');
    }
  }

  @override
  Future<Result<String>> register(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return Result.success(credential.user!.uid);
    } on auth.FirebaseAuthException catch (e) {
      return Result.failed("${e.message}");
    }
  }
}
