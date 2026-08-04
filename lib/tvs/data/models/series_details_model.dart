import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/tvs/data/models/genres_model.dart';
import 'package:movie_app/tvs/data/models/season_model.dart';
import 'package:movie_app/tvs/domain/entities/series_details.dart';

class SeriesDetailsModel extends SeriesDetails {
  const SeriesDetailsModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.backdropPath,
    required super.voteAverage,
    required super.numberOfSeasons,
    required super.firstAirDate,
    required super.genres,
    required super.seasons,
  });

  factory SeriesDetailsModel.fromJson(Map<String, dynamic> json) =>
      SeriesDetailsModel(
        id: json['id'],
        title: json['name'],
        overview: json['overview'],
        backdropPath: json['backdrop_path'] ?? AppConstants.notFoundImage,
        voteAverage: json['vote_average'].toDouble(),
        numberOfSeasons: json['number_of_seasons'],
        firstAirDate: json['first_air_date'],
        genres: List<SeriesGenresModel>.from(
          json['genres'].map((e) => SeriesGenresModel.fromJson(e)),
        ),
        seasons: List<SeasonModel>.from(
          json['seasons'].map((e) => SeasonModel.fromJson(e)),
        ),
      );
}
