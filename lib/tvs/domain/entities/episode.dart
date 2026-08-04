import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final int id;
  final int episodeNumber;
  final String name;
  final String overview;
  final String airDate;
  final String stillPath;

  const Episode({
    required this.id,
    required this.episodeNumber,
    required this.name,
    required this.overview,
    required this.airDate,
    required this.stillPath,
  });

  @override
  List<Object> get props => [
    id,
    episodeNumber,
    name,
    overview,
    airDate,
    stillPath,
  ];
}
