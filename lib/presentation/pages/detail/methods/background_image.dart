import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/domain/entities/movie_model.dart';
import 'package:flutter_nusa_movie/presentation/misc/constant.dart';

List<Widget> backgroundImage(MovieModel movie) => [
      Image.network(
        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0, 0.3),
            end: Alignment.topCenter,
            colors: [
              background.withOpacity(1),
              background.withOpacity(0.7),
            ],
          ),
        ),
      ),
    ];
