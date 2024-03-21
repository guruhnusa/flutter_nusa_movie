import 'package:flutter_nusa_movie/domain/usecase/get_actors/get_actor.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/movie_repository/movie_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_actor_provider.g.dart';

@riverpod
GetActor getActor(GetActorRef ref) {
  return GetActor(
    movieRepository: ref.watch(movieRepositoryProvider),
  );
}
