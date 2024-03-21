import 'package:flutter_nusa_movie/domain/usecase/logout/logout.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(LogoutRef ref) {
  return Logout(
    authenticationRepository: ref.watch(authenticationProvider),
  );
}
