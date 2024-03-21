import 'package:flutter_nusa_movie/data/repositories/movie_repository.dart';
import 'package:flutter_nusa_movie/domain/entities/actor_model.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_actors/get_actor_param.dart';
import 'package:flutter_nusa_movie/domain/usecase/usecase.dart';

class GetActor implements UseCase<Result<List<ActorModel>>, GetActorParam> {
  final MovieRepository _movieRepository;

  GetActor({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<ActorModel>>> call(GetActorParam params) async {
    final result = await _movieRepository.getActors(id: params.movieId);
    return switch (result) {
      Success(value: final actors) => Result.success(actors),
      Failed(:final message) => Result.failed(message),
    };
  }
}
