import 'package:movie_app/movies/data/models/genres_model.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.overView,
    required super.backdropPath,
    required super.voteAverage,
    required super.runTime,
    required super.releaseDate,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        title: json['title'],
        overView: json['overview'],
        backdropPath: json['backdrop_path'],
        voteAverage: json['vote_average'].toDouble(),
        runTime: json['runtime'],
        releaseDate: json['release_date'],
        genres: List<GenresModel>.from(
          json['genres'].map((e) => GenresModel.fromJson(e)),
        ),
      );
}
