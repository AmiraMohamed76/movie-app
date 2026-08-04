import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/tvs/domain/entities/episode.dart';

class EpisodeModel extends Episode {
  const EpisodeModel({
    required super.id,
    required super.episodeNumber,
    required super.name,
    required super.overview,
    required super.airDate,
    required super.stillPath,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
    id: json['id'],
    episodeNumber: json['episode_number'],
    name: json['name'],
    overview: json['overview'],
    airDate: json['air_date'],
    stillPath: json['still_path'] ?? AppConstants.notFoundImage,
  );
}
