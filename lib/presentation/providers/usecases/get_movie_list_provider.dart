import 'package:flutter_nusa_movie/domain/usecase/get_movie_list/get_movie_list.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/movie_repository/movie_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'get_movie_list_provider.g.dart';

@riverpod
GetMovieList getMovieList(GetMovieListRef ref) {
  return GetMovieList(movieRepository: ref.watch(movieRepositoryProvider));
}
