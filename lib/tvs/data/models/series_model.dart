import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/tvs/domain/entities/series.dart';

class SeriesModel extends Series {
  const SeriesModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.firstAirDate,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) => SeriesModel(
    id: json['id'],
    title: json['name'] ?? "",
    backdropPath: json['backdrop_path']?? AppConstants.notFoundImage,
    genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
    overview: json['overview'],
    voteAverage: json['vote_average'].toDouble(),
    firstAirDate: json['first_air_date'],
  );
}
