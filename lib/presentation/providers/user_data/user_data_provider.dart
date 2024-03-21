import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/user_model.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_logged_in_user/get_logged_in_user.dart';
import 'package:flutter_nusa_movie/domain/usecase/login/login.dart';
import 'package:flutter_nusa_movie/domain/usecase/logout/logout.dart';
import 'package:flutter_nusa_movie/domain/usecase/register/register.dart';
import 'package:flutter_nusa_movie/domain/usecase/register/register_params.dart';
import 'package:flutter_nusa_movie/domain/usecase/top_up/top_up.dart';
import 'package:flutter_nusa_movie/domain/usecase/top_up/top_up_param.dart';
import 'package:flutter_nusa_movie/domain/usecase/upload_profile/upload_profile.dart';
import 'package:flutter_nusa_movie/domain/usecase/upload_profile/upload_profile_param.dart';
import 'package:flutter_nusa_movie/presentation/providers/movie/now_playing_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/movie/upcoming_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/transaction_data/transaction_data_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/usecases/get_logged_in_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/usecases/login_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/usecases/logout_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/usecases/register_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/usecases/top_up_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/usecases/upload_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<UserModel?> build() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);
    final user = await getLoggedInUser.call(null);

    switch (user) {
      case Success(value: final user):
        _getMovies();
        return user;
      case Failed(message: _):
        return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    Login login = ref.read(loginProvider);
    final result =
        await login.call(LoginParams(email: email, password: password));

    switch (result) {
      case Success(value: final user):
        _getMovies();
        state = AsyncData(user);
      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> register({
    required String email,
    required String name,
    required String password,
    String? imageUrl,
  }) async {
    state = const AsyncLoading();
    Register register = ref.read(registerProvider);
    final result = await register
        .call(RegisterParam(name: name, email: email, password: password));
    switch (result) {
      case Success(value: final user):
        _getMovies();
        state = AsyncData(user);
      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> refreshUserData() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);
    final result = await getLoggedInUser.call(null);
    if (result case Success(value: final user)) {
      state = AsyncData(user);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    Logout logout = ref.read(logoutProvider);
    final result = await logout.call(null);
    switch (result) {
      case Success(value: final _):
        state = const AsyncData(null);
      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull);
    }
  }

  Future<void> topUp(int amount) async {
    TopUp topUp = ref.read(topUpProvider);
    String? userId = state.valueOrNull?.uid;
    if (userId != null) {
      final result =
          await topUp.call(TopUpParam(amount: amount, userId: userId));
      if (result.isSuccess) {
        refreshUserData();
        ref.read(transactionDataProvider.notifier).refreshTransaction();
      }
    }
  }

  Future<void> uploadProfile({
    required UserModel userModel,
    required File imageFile,
  }) async {
    UploadProfile uploadProfile = ref.read(uploadProfilProvider);
    final result = await uploadProfile
        .call(UploadProfileParam(imageFile: imageFile, userModel: userModel));
    if (result case Success(value: final user)) {
      state = AsyncData(user);
    }
  }

  void _getMovies() {
    ref.read(nowPlayingProvider.notifier).getMovies();
    ref.read(upcomingProvider.notifier).getMovies();
  }
}
