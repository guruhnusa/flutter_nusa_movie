import 'dart:io';

import 'package:flutter_nusa_movie/data/repositories/user_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/user_model.dart';

class DummyUserRepository implements UserRepository {
  @override
  Future<Result<UserModel>> createUser(
      {required String uid,
      required String email,
      required String name,
      String? photoUrl,
      int balance = 0}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<UserModel>> getUser({required String uid}) async {
    await Future.delayed(const Duration(seconds: 3));
    return Result.success(
        UserModel(uid: uid, email: 'nusa@gmail.com', name: 'Nusantara'));
  }

  @override
  Future<Result<int>> getUserBalance({required String uid}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<UserModel>> updateUser({required UserModel user}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<UserModel>> updateUserBalance(
      {required String uid, required int balance}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<UserModel>> uploadProfilePicture(
      {required UserModel user, required File imageFile}) {
    throw UnimplementedError();
  }
}
