import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/domain/entities/movie_detail_model.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieOverview({
  required AsyncValue<MovieDetailModel?> movieDetail,
}) =>
    [
      const Text('Overview',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      verticalSpace(10),
      Text(
        textAlign: TextAlign.justify,
        movieDetail.when(
          data: (movieDetail) =>
              movieDetail != null ? movieDetail.overview : '-',
          error: (error, stackTrace) => 'Failed to load overview. $error',
          loading: () => '-',
        ),
        style: const TextStyle(fontSize: 12),
      ),
    ];
