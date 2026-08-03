import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.id, super.backdropPath});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(id: json['id'], backdropPath: json['backdrop_path'] ?? AppConstants.notFoundImage);
}
