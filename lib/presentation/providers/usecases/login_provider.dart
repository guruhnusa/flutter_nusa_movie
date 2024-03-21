import 'package:flutter_nusa_movie/domain/usecase/login/login.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) {
  return Login(
    authenticationRepository: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider),
  );
}
