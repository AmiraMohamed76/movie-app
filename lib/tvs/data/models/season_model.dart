import 'package:movie_app/tvs/domain/entities/season.dart';

class SeasonModel extends Season {
  const SeasonModel({
    required super.id,
    required super.name,
    required super.seasonNumber,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
    id: json['id'],
    name: json['name'],
    seasonNumber: json['season_number'],
  );
}
