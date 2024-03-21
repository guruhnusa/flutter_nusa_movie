import 'dart:io';

import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/user_model.dart';

abstract interface class UserRepository {
  Future<Result<UserModel>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  });

  Future<Result<UserModel>> getUser({required String uid});
  Future<Result<UserModel>> updateUser({required UserModel user});
  Future<Result<int>> getUserBalance({required String uid});
  Future<Result<UserModel>> updateUserBalance(
      {required String uid, required int balance});
  Future<Result<UserModel>> uploadProfilePicture(
      {required UserModel user, required File imageFile});
}
