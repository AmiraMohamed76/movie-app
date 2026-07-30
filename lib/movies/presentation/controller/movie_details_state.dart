part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieState;
  final String movieMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieState = RequestState.loading,
    this.movieMessage = '',
  });

  @override
  List<Object?> get props => [movieDetails, movieState, movieMessage];
}
