import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/domain/entities/movie_model.dart';
import 'package:flutter_nusa_movie/presentation/widgets/network_image_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> movieList({
  required String title,
  void Function(MovieModel movie)? onTap,
  required AsyncValue<List<MovieModel>> movieList,
}) {
  return [
    Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 12),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    SizedBox(
      height: 180,
      child: movieList.when(
        data: (data) {
          return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: data
                      .map(
                        (movie) => Padding(
                          padding: EdgeInsets.only(
                              left: movie == data.first ? 24 : 10),
                          child: NetworkImageCard(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            fit: BoxFit.cover,
                            onTap: () => onTap?.call(movie),
                          ),
                        ),
                      )
                      .toList()));
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              'Error: ${error.toString()}',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    )
  ];
}
