import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/tvs/domain/entities/episode.dart';
import 'package:movie_app/tvs/domain/entities/series_details.dart';
import 'package:movie_app/tvs/domain/entities/series_recommendation.dart';
import 'package:movie_app/tvs/domain/use_cases/get_season_episodes_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_series_details_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_series_recommendation_usecase.dart';

part 'series_details_event.dart';

part 'series_details_state.dart';

class SeriesDetailsBloc extends Bloc<SeriesDetailsEvent, SeriesDetailsState> {
  final GetSeriesDetailsUseCase getSeriesDetailsUseCase;
  final GetSeriesRecommendationUseCase getSeriesRecommendationUseCase;
  final GetSeasonEpisodesUseCase getSeasonEpisodesUseCase;

  SeriesDetailsBloc(
    this.getSeriesDetailsUseCase,
    this.getSeriesRecommendationUseCase,
    this.getSeasonEpisodesUseCase,
  ) : super(SeriesDetailsState()) {
    on<GetSeriesDetailsEvent>(_getSeriesDetails);
    on<GetSeriesRecommendationEvent>(_getSeriesRecommendations);
    on<GetSeasonEpisodesEvent>(_getSeasonEpisodes);
    on<ChangeSeasonEvent>(_changeSeason);
  }

  FutureOr<void> _getSeriesDetails(
    GetSeriesDetailsEvent event,
    Emitter<SeriesDetailsState> emit,
  ) async {
    final result = await getSeriesDetailsUseCase(
      SeriesDetailsParameters(seriesId: event.seriesId),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          detailsState: RequestState.error,
          detailsMessage: failure.message,
        ),
      ),
      (result) => emit(
        state.copyWith(detailsState: RequestState.loaded, details: result),
      ),
    );
  }

  FutureOr<void> _getSeriesRecommendations(
    GetSeriesRecommendationEvent event,
    Emitter<SeriesDetailsState> emit,
  ) async {
    final result = await getSeriesRecommendationUseCase(
      SeriesRecommendationParameters(seriesId: event.seriesId),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          recommendationsState: RequestState.error,
          recommendationsMessage: failure.message,
        ),
      ),
      (result) => emit(
        state.copyWith(
          recommendationsState: RequestState.loaded,
          recommendations: result,
        ),
      ),
    );
  }

  FutureOr<void> _getSeasonEpisodes(
    GetSeasonEpisodesEvent event,
    Emitter<SeriesDetailsState> emit,
  ) async {
    emit(state.copyWith(episodesState: RequestState.loading));

    final result = await getSeasonEpisodesUseCase(
      SeasonEpisodeParameters(seriesId: event.seriesId, seasonNumber: event.seasonNumber),
    );

    result.fold(
          (failure) => emit(
        state.copyWith(
          episodesState: RequestState.error,
          episodesMessage: failure.message,
        ),
      ),
          (result) => emit(
        state.copyWith(
          episodesState: RequestState.loaded,
          episodes: result,
        ),
      ),
    );
  }

  FutureOr<void> _changeSeason(ChangeSeasonEvent event, Emitter<SeriesDetailsState> emit) {
    emit(state.copyWith(selectedSeason: event.seasonNumber));
  }
}
