import 'package:flutter_nusa_movie/domain/entities/actor_model.dart';
import 'package:flutter_nusa_movie/domain/entities/movie_detail_model.dart';
import 'package:flutter_nusa_movie/domain/entities/movie_model.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';

abstract interface class MovieRepository {
  Future<Result<List<MovieModel>>> getNowPlaying({
    int page = 1,
  });

  Future<Result<List<MovieModel>>> getUpcoming({
    int page = 1,
  });

  Future<Result<MovieDetailModel>> getDetailMovie({required int id});

  Future<Result<List<ActorModel>>> getActors({required int id});
}
