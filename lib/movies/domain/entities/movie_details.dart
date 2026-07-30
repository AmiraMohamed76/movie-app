import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String overView;
  final String backdropPath;
  final double voteAverage;
  final int runTime;
  final int releaseDate;
  final List<Genres> genres;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.overView,
    required this.backdropPath,
    required this.voteAverage,
    required this.runTime,
    required this.releaseDate,
    required this.genres,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    overView,
    backdropPath,
    voteAverage,
    runTime,
    releaseDate,
    genres
  ];
}
