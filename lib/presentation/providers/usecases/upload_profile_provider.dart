import 'package:flutter_nusa_movie/domain/usecase/upload_profile/upload_profile.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_profile_provider.g.dart';

@riverpod
UploadProfile uploadProfil(UploadProfilRef ref) {
  return UploadProfile(userRepository: ref.watch(userRepositoryProvider));
}
