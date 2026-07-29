import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String realseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.realseDate,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    backdropPath,
    genreIds,
    overview,
    voteAverage,
    realseDate,
  ];
}

// {
// "adult": false,
// "backdrop_path": "/RMXG8myu1aGlNUsRjtxzmpdMK0.jpg",
// "genre_ids": [
// 12,
// 28,
// 14
// ],
// "id": 1368337,
// "title": "The Odyssey",
// "original_language": "en",
// "original_title": "The Odyssey",
// "overview": "Odysseus, the legendary King of Ithaca, embarks on a long and perilous journey home following the Trojan War. Throughout his voyage, he is forced to confront the whims of gods, mythological monsters, and trials that stretch both his cunning and his humanity to the breaking point.",
// "popularity": 1012.4511,
// "poster_path": "/5rhTDKUhPYvpdQIijFIs5VoWsON.jpg",
// "release_date": "2026-07-15",
// "softcore": false,
// "video": false,
// "vote_average": 8,
// "vote_count": 1626
// },
