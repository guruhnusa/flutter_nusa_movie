import 'package:flutter_nusa_movie/data/repositories/authentication_repository.dart';
import 'package:flutter_nusa_movie/data/repositories/user_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/user_model.dart';
import 'package:flutter_nusa_movie/domain/usecase/register/register_params.dart';
import 'package:flutter_nusa_movie/domain/usecase/usecase.dart';

class Register implements UseCase<Result<UserModel>, RegisterParam> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  Register(
      {required AuthenticationRepository authenticationRepository,
      required UserRepository userRepository})
      : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository;

  @override
  Future<Result<UserModel>> call(RegisterParam params) async {
    final uidResult = await _authenticationRepository.register(
        email: params.email, password: params.password);
    if (uidResult.isSuccess) {
      final userResult = await _userRepository.createUser(
        uid: uidResult.resultValue!,
        email: params.email,
        name: params.name,
        photoUrl: params.photoUrl,
      );
      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return Result.failed(uidResult.errorMessage!);
    }
  }
}
