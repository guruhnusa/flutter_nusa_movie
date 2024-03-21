import 'package:flutter_nusa_movie/data/repositories/authentication_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/usecase/usecase.dart';

class Logout implements UseCase<Result, void> {
  final AuthenticationRepository authenticationRepository;

  Logout({required this.authenticationRepository});

  @override
  Future<Result> call(void _) async {
    return authenticationRepository.logout();
  }
}
