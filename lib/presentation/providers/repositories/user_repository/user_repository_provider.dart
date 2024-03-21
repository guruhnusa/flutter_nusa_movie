import 'package:flutter_nusa_movie/data/Firebase/firebase_user_repository.dart';
import 'package:flutter_nusa_movie/data/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return FirebaseUserRepository();
}
