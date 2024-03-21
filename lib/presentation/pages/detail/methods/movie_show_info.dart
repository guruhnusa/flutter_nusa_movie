import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/domain/entities/movie_detail_model.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> moviewShowInfo({
  required AsyncValue<MovieDetailModel?> movieDetail,
  required BuildContext context,
}) =>
    [
      Row(
        children: [
          SizedBox(
            width: 14,
            height: 14,
            child: Image.asset('assets/duration.png'),
          ),
          horizontalSpace(10),
          SizedBox(
            width: 95,
            child: Text(
              '${movieDetail.when(
                data: (movieDetail) =>
                    movieDetail != null ? movieDetail.runtime : '-',
                error: (error, stackTrace) => '-',
                loading: () => '-',
              )} minutes',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            width: 14,
            height: 14,
            child: Image.asset('assets/duration.png'),
          ),
          horizontalSpace(5),
          SizedBox(
            width: MediaQuery.of(context).size.width - 48 - 95 - 14 - 14 - 15,
            child: movieDetail.when(
              data: (movieDetail) {
                String genres = movieDetail?.genres.join(', ') ?? '-';
                return Text(
                  genres,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                );
              },
              error: (error, stackTrace) => const Text(
                '-',
                style: TextStyle(fontSize: 12),
              ),
              loading: () => const Text(
                '',
                style: TextStyle(fontSize: 12),
              ),
            ),
          )
        ],
      ),
      verticalSpace(10),
      Row(
        children: [
          SizedBox(
            width: 14,
            height: 14,
            child: Image.asset('assets/star.png'),
          ),
          horizontalSpace(10),
          Text(
            movieDetail.valueOrNull?.voteAverage.toStringAsFixed(1) ?? '-',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    ];
