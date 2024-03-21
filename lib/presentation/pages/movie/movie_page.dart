import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_nusa_movie/presentation/pages/movie/methods/movie_list.dart';
import 'package:flutter_nusa_movie/presentation/pages/movie/methods/promotion_list.dart';
import 'package:flutter_nusa_movie/presentation/pages/movie/methods/search_bar.dart';
import 'package:flutter_nusa_movie/presentation/pages/movie/methods/user_info.dart';
import 'package:flutter_nusa_movie/presentation/providers/movie/now_playing_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/movie/upcoming_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/routers/router_name.dart';
import 'package:flutter_nusa_movie/presentation/providers/routers/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviePage extends ConsumerWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> promotionImage = [
      'assets/popcorn.jpg',
      'assets/buy1get1.jpg',
    ];
    return SafeArea(
      child: ListView(
        children: [
          userInfo(ref),
          verticalSpace(20),
          searchBar(context),
          verticalSpace(20),
          ...movieList(
            title: 'Now Playing',
            movieList: ref.watch(nowPlayingProvider),
            onTap: (movie) {
              ref
                  .read(routerProvider)
                  .pushNamed(RouterName.detail, extra: movie);
            },
          ),
          ...promotionList(promotionImage),
          verticalSpace(20),
          ...movieList(
            title: 'Upcoming',
            movieList: ref.watch(upcomingProvider),
            onTap: (movie) {},
          ),
          verticalSpace(100),
        ],
      ),
    );
  }
}
