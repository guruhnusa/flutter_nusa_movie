import 'package:flutter_nusa_movie/domain/entities/movie_detail_model.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_movie_detail/get_movie_detal_param.dart';
import 'package:flutter_nusa_movie/domain/usecase/usecase.dart';

import '../../../data/repositories/movie_repository.dart';

class GetMovieDetail
    implements UseCase<Result<MovieDetailModel>, GetMovieDetailParam> {
  final MovieRepository _movieRepository;

  GetMovieDetail({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<MovieDetailModel>> call(GetMovieDetailParam params) async {
    final result = await _movieRepository.getDetailMovie(id: params.movieId.id);
    return switch (result) {
      Success(value: final movie) => Result.success(movie),
      Failed(:final message) => Result.failed(message),
    };
  }
}
