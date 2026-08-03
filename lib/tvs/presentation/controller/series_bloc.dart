import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/tvs/domain/entities/series.dart';
import 'package:movie_app/tvs/domain/use_cases/get_on_air_series_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_popular_series_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_top_rated_series_usecase.dart';

part 'series_event.dart';

part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final GetOnAirSeriesUseCase getOnAirSeriesUseCase;
  final GetPopularSeriesUseCase getPopularSeriesUseCase;
  final GetTopRatedSeriesUseCase getTopRatedSeriesUseCase;

  SeriesBloc(
    this.getOnAirSeriesUseCase,
    this.getPopularSeriesUseCase,
    this.getTopRatedSeriesUseCase,
  ) : super(SeriesState()) {
    on<GetOnAirSeriesEvent>(_getOnAirSeries);
    on<GetPopularSeriesEvent>(_getPopularSeries);
    on<GetTopRatedSeriesEvent>(_getTopRatedSeries);
  }

  FutureOr<void> _getOnAirSeries(
    GetOnAirSeriesEvent event,
    Emitter<SeriesState> emit,
  ) async {
    final result = await getOnAirSeriesUseCase(const NoParameters());

    result.fold(
      (failure) => emit(
        state.copyWith(
          onAirSeriesState: RequestState.error,
          onAirSeriesMessage: failure.message,
        ),
      ),
      (result) => emit(
        state.copyWith(
          onAirSeriesState: RequestState.loaded,
          onAirSeries: result,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularSeries(
    GetPopularSeriesEvent event,
    Emitter<SeriesState> emit,
  ) async {
    final result = await getPopularSeriesUseCase(const NoParameters());

    result.fold(
          (failure) => emit(
        state.copyWith(
          popularSeriesState: RequestState.error,
          popularSeriesMessage: failure.message,
        ),
      ),
          (result) => emit(
        state.copyWith(
          popularSeriesState: RequestState.loaded,
          popularSeries: result,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedSeries(
    GetTopRatedSeriesEvent event,
    Emitter<SeriesState> emit,
  ) async {
    final result = await getTopRatedSeriesUseCase(const NoParameters());

    result.fold(
          (failure) => emit(
        state.copyWith(
          topRatedSeriesState: RequestState.error,
          topRatedSeriesMessage: failure.message,
        ),
      ),
          (result) => emit(
        state.copyWith(
          topRatedSeriesState: RequestState.loaded,
          topRatedSeries: result,
        ),
      ),
    );
  }
}
