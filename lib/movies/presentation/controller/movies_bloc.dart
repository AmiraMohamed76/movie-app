import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_top_rated_movies_usecase.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPLayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPLayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
      (failure) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: failure.message,
        ),
      ),
      (result) => emit(
        state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: result,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getPopularMoviesUseCase(const NoParameters());

    result.fold(
      (failure) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: failure.message,
        ),
      ),
      (result) => emit(
        state.copyWith(popularState: RequestState.loaded, popularMovies: result),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
      (failure) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: failure.message,
        ),
      ),
      (result) => emit(
        state.copyWith(topRatedState: RequestState.loaded, topRatedMovies: result),
      ),
    );
  }
}
