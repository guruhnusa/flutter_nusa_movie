import 'dart:io';
import 'package:flutter_nusa_movie/domain/entities/user_model.dart';

class UploadProfileParam {
  final File imageFile;
  final UserModel userModel;

  UploadProfileParam({required this.imageFile, required this.userModel});
}
