import 'package:movie_app/tvs/domain/entities/series_genres.dart';

class SeriesGenresModel extends SeriesGenres {
  const SeriesGenresModel({required super.id, required super.name});

  factory SeriesGenresModel.fromJson(Map<String, dynamic> json) =>
      SeriesGenresModel(id: json['id'], name: json['name']);
}
