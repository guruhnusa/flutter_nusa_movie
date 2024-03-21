import 'package:flutter_nusa_movie/domain/entities/result.dart';

abstract interface class AuthenticationRepository {
  Future<Result<String>> login(
      {required String email, required String password});
  Future<Result<String>> register(
      {required String email, required String password});
  Future<Result<void>> logout();
  String? getLoggedInUserId();
}

