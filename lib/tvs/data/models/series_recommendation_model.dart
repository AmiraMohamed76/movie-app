import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/tvs/domain/entities/series_recommendation.dart';

class SeriesRecommendationModel extends SeriesRecommendation {
  const SeriesRecommendationModel({required super.id, super.backdropPath});

  factory SeriesRecommendationModel.fromJson(Map<String, dynamic> json) =>
      SeriesRecommendationModel(
        id: json['id'],
        backdropPath: json['backdrop_path'] ?? AppConstants.notFoundImage,
      );
}
