import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail_model.freezed.dart';

@freezed
class MovieDetailModel with _$MovieDetailModel {
  factory MovieDetailModel({
    required int id,
    required String title,
    required String overview,
    String? posterPath,
    String? backdropPath,
    required int runtime,
    required double voteAverage,
    required List<String> genres,
  }) = _MovieDetailModel;

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      runtime: json['runtime'],
      voteAverage: json['vote_average'].toDouble(),
      genres: List<String>.from(
        json['genres'].map((e) => e['name']),
      ),
    );
  }
}
