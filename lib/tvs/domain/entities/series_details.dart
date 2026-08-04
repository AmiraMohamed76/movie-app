import 'package:equatable/equatable.dart';
import 'package:movie_app/tvs/domain/entities/season.dart';

import 'series_genres.dart';

class SeriesDetails extends Equatable{

  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final double voteAverage;
  final int numberOfSeasons;
  final String firstAirDate;
  final List<SeriesGenres> genres;
  final List<Season> seasons;

  const SeriesDetails({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.voteAverage,
    required this.numberOfSeasons,
    required this.firstAirDate,
    required this.genres,
    required this.seasons,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    overview,
    backdropPath,
    voteAverage,
    numberOfSeasons,
    firstAirDate,
    genres,
    seasons
  ];

}