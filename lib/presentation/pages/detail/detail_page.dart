import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/domain/entities/movie_detail_model.dart';

import 'package:flutter_nusa_movie/domain/entities/movie_model.dart';
import 'package:flutter_nusa_movie/presentation/misc/constant.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_nusa_movie/presentation/pages/detail/methods/background_image.dart';
import 'package:flutter_nusa_movie/presentation/pages/detail/methods/movie_cast.dart';
import 'package:flutter_nusa_movie/presentation/pages/detail/methods/movie_overview.dart';
import 'package:flutter_nusa_movie/presentation/pages/detail/methods/movie_show_info.dart';
import 'package:flutter_nusa_movie/presentation/providers/movie/movie_detail_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/routers/router_name.dart';
import 'package:flutter_nusa_movie/presentation/providers/routers/router_provider.dart';
import 'package:flutter_nusa_movie/presentation/widgets/back_navigation_bar.dart';
import 'package:flutter_nusa_movie/presentation/widgets/network_image_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final MovieModel movie;
  const DetailPage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetail = ref.watch(MovieDetailProvider(movieModel: movie));
    return Scaffold(
      body: Stack(
        children: [
          ...backgroundImage(
            movie,
          ),
          SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BackNavigationBar(
                        onTap: () {
                          ref.read(routerProvider).pop();
                        },
                        title: movie.title,
                      ),
                      verticalSpace(24),
                      NetworkImageCard(
                        width: MediaQuery.of(context).size.width - 48,
                        height: (MediaQuery.of(context).size.width - 48) * 0.6,
                        imageUrl: movieDetail.valueOrNull?.backdropPath != null
                            ? 'https://image.tmdb.org/t/p/w500${movieDetail.valueOrNull!.backdropPath}'
                            : null,
                        fit: BoxFit.cover,
                      ),
                      verticalSpace(24),
                      ...moviewShowInfo(
                        context: context,
                        movieDetail: movieDetail,
                      ),
                      verticalSpace(20),
                      ...movieOverview(
                        movieDetail: movieDetail,
                      ),
                    ],
                  ),
                ),
                verticalSpace(24),
                ...movieCast(
                  ref: ref,
                  movie: movie,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: background,
                        backgroundColor: saffron,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        MovieDetailModel? movie = movieDetail.valueOrNull;
                        if (movie != null) {
                          ref
                              .read(routerProvider)
                              .pushNamed(RouterName.timeBooking, extra: movie);
                        }
                      },
                      child: const Text(
                        "Book this Movie",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
