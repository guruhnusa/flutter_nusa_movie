import 'package:flutter_nusa_movie/domain/entities/movie_model.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_movie_list/get_movie_list.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_movie_list/get_movie_list_param.dart';
import 'package:flutter_nusa_movie/presentation/providers/usecases/get_movie_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';

part 'upcoming_provider.g.dart';

@Riverpod(keepAlive: true)
class Upcoming extends _$Upcoming {
  @override
  FutureOr<List<MovieModel>> build() {
    return [];
  }

  Future<void> getMovies({int page = 1}) async {
    state = const AsyncLoading();
    GetMovieList getMovieList = ref.read(getMovieListProvider);
    final result = await getMovieList.call(GetMovieListParam(
        categories: MovieListCategories.upcoming, page: page));
    switch (result) {
      case Success(value: final movies):
        state = AsyncData(movies);
      case Failed(message: final error):
        state = AsyncError(error, StackTrace.current);
    }
  }
}
