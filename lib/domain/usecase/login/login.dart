// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_nusa_movie/data/repositories/authentication_repository.dart';
import 'package:flutter_nusa_movie/data/repositories/user_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/user_model.dart';
import 'package:flutter_nusa_movie/domain/usecase/usecase.dart';

part 'login_params.dart';

class Login implements UseCase<Result<UserModel>, LoginParams> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  Login({
    required this.authenticationRepository,
    required this.userRepository,
  });

  @override
  Future<Result<UserModel>> call(LoginParams params) async {
    final idResult = await authenticationRepository.login(
        email: params.email, password: params.password);
    if (idResult is Success) {
      final userResult =
          await userRepository.getUser(uid: idResult.resultValue!);
      return switch (userResult) {
        Success(value: final user) => Result.success(user),
        Failed(:final message) => Result.failed(message),
      };
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
}
