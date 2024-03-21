import 'package:flutter_nusa_movie/data/repositories/authentication_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';

class DummyAuthentication implements AuthenticationRepository {
  @override
  String? getLoggedInUserId() {
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 3));

    // return const Result.success('ID-12345');
    return const Result.failed('Gagal cok');
  }

  @override
  Future<Result<void>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> register(
      {required String email, required String password}) {
    throw UnimplementedError();
  }
}
