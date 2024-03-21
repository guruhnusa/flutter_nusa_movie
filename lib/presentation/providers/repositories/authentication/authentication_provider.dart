import 'package:flutter_nusa_movie/data/Firebase/firebase_authentication.dart';
import 'package:flutter_nusa_movie/data/repositories/authentication_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
AuthenticationRepository authentication(AuthenticationRef ref) {
  return FirebaseAuthentication();
}
