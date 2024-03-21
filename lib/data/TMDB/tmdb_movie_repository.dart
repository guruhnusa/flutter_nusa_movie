import 'package:flutter_nusa_movie/data/repositories/movie_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/actor_model.dart';
import 'package:flutter_nusa_movie/domain/entities/movie_detail_model.dart';
import 'package:flutter_nusa_movie/domain/entities/movie_model.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:dio/dio.dart';

class TmdbMovieRepository implements MovieRepository {
  final Dio _dio;
  final String _accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4OGJhMjRlYmE4NjU0MDgyZjhhNjlhNWE3NDRlZGNjNSIsInN1YiI6IjY1ZWFiMzIzNmEyMjI3MDE2Mzk2NDcyNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.b79696bilKTuVQfGTbhCbPtlUe1JAZPyCWXbbzrXgXU';
  late final Options _options = Options(
    headers: {
      'Authorization': 'Bearer $_accessToken',
      'accept': 'application/json',
    },
  );

  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<ActorModel>>> getActors({required int id}) async {
    final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/$id/credits?language=en-US',
        options: _options);
    if (response.statusCode == 200) {
      final data = List.from(response.data['cast']);
      final actors = data.map((e) => ActorModel.fromJson(e)).toList();
      return Result.success(actors);
    } else {
      return Result.failed("Error: ${response.statusCode}");
    }
  }

  @override
  Future<Result<MovieDetailModel>> getDetailMovie({required int id}) async {
    final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/$id?language=en-US',
        options: _options);
    if (response.statusCode == 200) {
      final movie = MovieDetailModel.fromJson(response.data);
      return Result.success(movie);
    } else {
      return Result.failed("Error: ${response.statusCode}");
    }
  }

  @override
  Future<Result<List<MovieModel>>> getNowPlaying({int page = 1}) async {
    return getMovies(MovieCategory.nowPlaying.toString());
  }

  @override
  Future<Result<List<MovieModel>>> getUpcoming({int page = 1}) {
    return getMovies(MovieCategory.upcoming.toString());
  }

  Future<Result<List<MovieModel>>> getMovies(String category,
      {int page = 1}) async {
    final response = await _dio.get(
      'https://api.themoviedb.org/3/movie/$category?language=en-US&page=$page',
      options: _options,
    );

    try {
      final data = List.from(response.data['results']);
      final movies = data.map((e) => MovieModel.fromJSON(e)).toList();
      return Result.success(movies);
    } on DioException catch (e) {
      return Result.failed("Error: ${e.message}");
    }
  }
}

enum MovieCategory {
  nowPlaying('now_playing'),
  upcoming('upcoming');

  final String _instring;
  const MovieCategory(String instring) : _instring = instring;

  @override
  String toString() => _instring;
}
