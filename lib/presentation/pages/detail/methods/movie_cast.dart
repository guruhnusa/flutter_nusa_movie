import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_nusa_movie/domain/entities/movie_model.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_nusa_movie/presentation/providers/movie/actor_provider.dart';
import 'package:flutter_nusa_movie/presentation/widgets/network_image_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

List<Widget> movieCast({
  required MovieModel movie,
  required WidgetRef ref,
}) =>
    [
      const Padding(
        padding: EdgeInsets.only(left: 24),
        child: Text('Cast and Crew'),
      ),
      verticalSpace(10),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            horizontalSpace(24),
            ...(ref
                    .watch(
                      ActorProvider(movieId: movie.id),
                    )
                    .whenOrNull(
                      data: (actors) => actors
                          .where((element) => element.profilePath != null)
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  NetworkImageCard(
                                    width: 100,
                                    height: 150,
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/w500${e.profilePath}',
                                  ),
                                  verticalSpace(5),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      e.name,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ) ??
                []),
            horizontalSpace(14)
          ],
        ),
      )
    ];
