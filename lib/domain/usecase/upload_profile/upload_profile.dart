import 'package:flutter_nusa_movie/data/repositories/user_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/user_model.dart';
import 'package:flutter_nusa_movie/domain/usecase/upload_profile/upload_profile_param.dart';
import 'package:flutter_nusa_movie/domain/usecase/usecase.dart';

class UploadProfile implements UseCase<Result<UserModel>, UploadProfileParam> {
  final UserRepository _userRepository;

  UploadProfile({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Result<UserModel>> call(UploadProfileParam params) {
    return _userRepository.uploadProfilePicture(
      imageFile: params.imageFile,
      user: params.userModel,
    );
  }
}
