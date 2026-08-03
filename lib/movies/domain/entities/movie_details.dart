import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final double voteAverage;
  final int runtime;
  final String releaseDate;
  final List<Genres> genres;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.voteAverage,
    required this.runtime,
    required this.releaseDate,
    required this.genres,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    overview,
    backdropPath,
    voteAverage,
    runtime,
    releaseDate,
    genres
  ];
}
