import 'package:flutter_nusa_movie/data/repositories/authentication_repository.dart';
import 'package:flutter_nusa_movie/data/repositories/user_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/user_model.dart';
import 'package:flutter_nusa_movie/domain/usecase/usecase.dart';

class GetLoggedInUser implements UseCase<Result<UserModel>, void> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  GetLoggedInUser(
      {required AuthenticationRepository authenticationRepository,
      required UserRepository userRepository})
      : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository;

  @override
  Future<Result<UserModel>> call(void params) async {
    String? loggedId = _authenticationRepository.getLoggedInUserId();
    if (loggedId != null) {
      final userResult = await _userRepository.getUser(uid: loggedId);
      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return const Result.failed('No User Logged In');
    }
  }
}
