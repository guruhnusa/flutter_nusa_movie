import 'package:flutter_nusa_movie/domain/usecase/register/register.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
Register register(RegisterRef ref) {
  return Register(
    authenticationRepository: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider),
  );
}
