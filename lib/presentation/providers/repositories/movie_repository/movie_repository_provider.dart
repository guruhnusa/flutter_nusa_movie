import 'package:flutter_nusa_movie/data/TMDB/tmdb_movie_repository.dart';
import 'package:flutter_nusa_movie/data/repositories/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository_provider.g.dart';

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {
  return TmdbMovieRepository();
}
