import 'package:flutter_nusa_movie/domain/usecase/get_movie_detail/get_movie_detail.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/movie_repository/movie_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_detail_provider.g.dart';

@riverpod
GetMovieDetail getMovieDetail(GetMovieDetailRef ref) {
  return GetMovieDetail(
    movieRepository: ref.watch(movieRepositoryProvider),
  );
}
