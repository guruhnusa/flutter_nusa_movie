import 'package:flutter_nusa_movie/data/repositories/user_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_user_balance/get_user_balance_param.dart';
import 'package:flutter_nusa_movie/domain/usecase/usecase.dart';

class GetUserBalance implements UseCase<Result<int>, GetUserBalanceParam> {
  final UserRepository _userRepository;

  GetUserBalance({required UserRepository userRepository})
      : _userRepository = userRepository;
  @override
  Future<Result<int>> call(GetUserBalanceParam params) {
    return _userRepository.getUserBalance(uid: params.userId);
  }
}
