import 'package:equatable/equatable.dart';

class Series extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String firstAirDate;

  const Series({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.firstAirDate,
  });

  @override
  List<Object> get props => [
    id,
    title,
    backdropPath,
    genreIds,
    overview,
    voteAverage,
    firstAirDate,
  ];
}
