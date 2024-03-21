import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_nusa_movie/data/repositories/user_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/user_model.dart';
import 'package:path/path.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseUserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<UserModel>> createUser(
      {required String uid,
      required String email,
      required String name,
      String? photoUrl,
      int balance = 0}) async {
    CollectionReference<Map<String, dynamic>> users =
        _firebaseFirestore.collection('users');

    //create user
    await users.doc(uid).set({
      'uid': uid,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'balance': balance,
    });
    //get user data
    DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uid).get();

    if (result.exists) {
      return Result.success(UserModel.fromJson(result.data()!));
    } else {
      return const Result.failed('Failed to create user account');
    }
  }

  @override
  Future<Result<UserModel>> getUser({required String uid}) async {
    DocumentReference<Map<String, dynamic>> userDoc =
        _firebaseFirestore.doc('users/$uid');
    DocumentSnapshot<Map<String, dynamic>> result = await userDoc.get();
    if (result.exists) {
      return Result.success(UserModel.fromJson(result.data()!));
    } else {
      return const Result.failed('User not found');
    }
  }

  @override
  Future<Result<int>> getUserBalance({required String uid}) async {
    DocumentReference<Map<String, dynamic>> userDoc =
        _firebaseFirestore.doc('users/$uid');
    DocumentSnapshot<Map<String, dynamic>> result = await userDoc.get();
    if (result.exists) {
      return Result.success(result.data()!['balance']);
    } else {
      return const Result.failed('User not found');
    }
  }

  @override
  Future<Result<UserModel>> updateUser({required UserModel user}) async {
    try {
      DocumentReference<Map<String, dynamic>> userDoc =
          _firebaseFirestore.doc('users/${user.uid}');

      await userDoc.update(user.toJson());
      DocumentSnapshot<Map<String, dynamic>> result = await userDoc.get();
      if (result.exists) {
        UserModel updatedUser = UserModel.fromJson(result.data()!);
        if (updatedUser == user) {
          return Result.success(updatedUser);
        } else {
          return const Result.failed('Failed to update user not match');
        }
      } else {
        return const Result.failed('Failed to update user');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<UserModel>> updateUserBalance(
      {required String uid, required int balance}) async {
    DocumentReference<Map<String, dynamic>> userDoc =
        _firebaseFirestore.doc('users/$uid');
    DocumentSnapshot<Map<String, dynamic>> result = await userDoc.get();
    if (result.exists) {
      await userDoc.update({'balance': balance});
      DocumentSnapshot<Map<String, dynamic>> updatedResult =
          await userDoc.get();
      if (updatedResult.exists) {
        UserModel updatedUser = UserModel.fromJson(updatedResult.data()!);
        if (updatedUser.balance == balance) {
          return Result.success(updatedUser);
        } else {
          return const Result.failed('Failed to update user balance not match');
        }
      } else {
        return const Result.failed(
            'Failed to update user balance user not exists');
      }
    } else {
      return const Result.failed('Failed to update user balance');
    }
  }

  @override
  Future<Result<UserModel>> uploadProfilePicture(
      {required UserModel user, required File imageFile}) async {
    String fileName = basename(imageFile.path);
    Reference ref = FirebaseStorage.instance.ref().child(fileName);

    try {
      await ref.putFile(imageFile);
      String photoUrl = await ref.getDownloadURL();
      final updateResult =
          await updateUser(user: user.copyWith(photoUrl: photoUrl));
      if (updateResult.isSuccess) {
        return Result.success(updateResult.resultValue!);
      } else {
        return Result.failed(updateResult.errorMessage!);
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message!);
    }
  }
}
