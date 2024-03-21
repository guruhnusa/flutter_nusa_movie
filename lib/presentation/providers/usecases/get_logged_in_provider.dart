import 'package:flutter_nusa_movie/domain/usecase/get_logged_in_user/get_logged_in_user.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_logged_in_provider.g.dart';

@riverpod
GetLoggedInUser getLoggedInUser(GetLoggedInUserRef ref) {
  return GetLoggedInUser(
    authenticationRepository: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider),
  );
}
