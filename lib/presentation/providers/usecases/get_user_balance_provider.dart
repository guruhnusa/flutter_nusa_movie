import 'package:flutter_nusa_movie/domain/usecase/get_user_balance/get_user_balance.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_balance_provider.g.dart';

@riverpod
GetUserBalance getUserBalanve(GetUserBalanveRef ref) {
  return GetUserBalance(userRepository: ref.watch(userRepositoryProvider));
}
