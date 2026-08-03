import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';
import 'package:movie_app/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendationUseCase,
  ) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationsEvent>(_getMovieRecommendations);
  }

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetailsUseCase(
      MovieDetailsParameters(movieId: event.id),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: failure.message,
        ),
      ),
      (result) => emit(
        state.copyWith(
          movieDetailsState: RequestState.loaded,
          movieDetails: result,
        ),
      ),
    );
  }

  FutureOr<void> _getMovieRecommendations(
    GetRecommendationsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async{
    final result = await getRecommendationUseCase(
      RecommendationParameters(movieId: event.id),
    );

    result.fold(
          (failure) => emit(
        state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: failure.message,
        ),
      ),
          (result) => emit(
        state.copyWith(
          recommendationState: RequestState.loaded,
          recommendation: result,
        ),
      ),
    );
  }
}
