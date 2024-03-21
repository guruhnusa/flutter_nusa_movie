import 'package:flutter_nusa_movie/domain/entities/movie_detail_model.dart';
import 'package:flutter_nusa_movie/domain/entities/movie_model.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_movie_detail/get_movie_detail.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_movie_detail/get_movie_detal_param.dart';
import 'package:flutter_nusa_movie/presentation/providers/usecases/get_movie_detail_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_detail_provider.g.dart';

@riverpod
Future<MovieDetailModel?> movieDetail(MovieDetailRef ref,
    {required MovieModel movieModel}) async {
  GetMovieDetail getMovieDetail = ref.read(getMovieDetailProvider);
  final movieDetail =
      await getMovieDetail.call(GetMovieDetailParam(movieId: movieModel));

  return switch (movieDetail) {
    Success(value: final movie) => movie,
    Failed(message: _) => null,
  };
}
