part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable{}

class GetMovieDetailsEvent extends MovieDetailsEvent{
  final int id;

  GetMovieDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetMovieRecommendationsEvent extends MovieDetailsEvent{
  final int id;

  GetMovieRecommendationsEvent(this.id);

  @override
  List<Object?> get props => [id];
}
