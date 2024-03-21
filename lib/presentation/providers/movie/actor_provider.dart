import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_actors/get_actor.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_actors/get_actor_param.dart';
import 'package:flutter_nusa_movie/presentation/providers/usecases/get_actor_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_nusa_movie/domain/entities/actor_model.dart';
part 'actor_provider.g.dart';

@riverpod
Future<List<ActorModel>> actor(ActorRef ref, {required int movieId}) async {
  GetActor getActor = ref.read(getActorProvider);
  final actors = await getActor.call(GetActorParam(movieId: movieId));

  return switch (actors) {
    Success(value: final actor) => actor,
    Failed(message: _) => [],
  };
}
