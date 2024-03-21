import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';

@freezed
class MovieModel with _$MovieModel {
  factory MovieModel({
    required int id,
    required String title,
    String? posterPath,
  }) = _MovieModel;

  factory MovieModel.fromJSON(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
    );
  }
}
