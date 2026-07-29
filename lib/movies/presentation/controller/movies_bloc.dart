import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/use_cases/get_now_playing_movies_usecase.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPLayingMovies);
  }

  FutureOr<void> _getNowPLayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {

    final result = await getNowPlayingMoviesUseCase.execute();
    result.fold(
      (failure) => emit(
        MoviesState(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: failure.message,
        ),
      ),
      (result) => emit(
        MoviesState(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: result,
        ),
      ),
    );
  }
}
