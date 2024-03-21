import 'package:flutter_nusa_movie/data/repositories/movie_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/movie_model.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_movie_list/get_movie_list_param.dart';
import 'package:flutter_nusa_movie/domain/usecase/usecase.dart';

class GetMovieList
    implements UseCase<Result<List<MovieModel>>, GetMovieListParam> {
  final MovieRepository _movieRepository;

  GetMovieList({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<MovieModel>>> call(GetMovieListParam params) async {
    final movieResult = switch (params.categories) {
      MovieListCategories.nowPlaying => await _movieRepository.getNowPlaying(
          page: params.page,
        ),
      MovieListCategories.upcoming => await _movieRepository.getUpcoming(
          page: params.page,
        ),
    };

    return switch (movieResult) {
      Success(value: final movies) => Result.success(movies),
      Failed(:final message) => Result.failed(message)
    };
  }
}
