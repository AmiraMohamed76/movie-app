part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable{}

class GetMovieDetailsEvent extends MovieDetailsEvent{
  final int id;

  GetMovieDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetRecommendationsEvent extends MovieDetailsEvent{
  final int id;

  GetRecommendationsEvent(this.id);

  @override
  List<Object?> get props => [id];
}
