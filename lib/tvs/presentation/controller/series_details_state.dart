part of 'series_details_bloc.dart';

class SeriesDetailsState extends Equatable {
  final SeriesDetails? details;
  final RequestState detailsState;
  final String detailsMessage;
  final List<SeriesRecommendation> recommendations;
  final RequestState recommendationsState;
  final String recommendationsMessage;
  final List<Episode> episodes;
  final RequestState episodesState;
  final String episodesMessage;
  final int selectedSeason;

  const SeriesDetailsState({
    this.details,
    this.detailsState = RequestState.loading,
    this.detailsMessage = '',
    this.recommendations = const [],
    this.recommendationsState = RequestState.loading,
    this.recommendationsMessage = '',
    this.episodes = const [],
    this.episodesState = RequestState.loading,
    this.episodesMessage = '',
    this.selectedSeason = 0,
  });

  SeriesDetailsState copyWith({
    SeriesDetails? details,
    RequestState? detailsState,
    String? detailsMessage,
    List<SeriesRecommendation>? recommendations,
    RequestState? recommendationsState,
    String? recommendationsMessage,
    List<Episode>? episodes,
    RequestState? episodesState,
    String? episodesMessage,
    int? selectedSeason,
  }) {
    return SeriesDetailsState(
      details: details ?? this.details,
      detailsState: detailsState ?? this.detailsState,
      detailsMessage: detailsMessage ?? this.detailsMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationsState: recommendationsState ?? this.recommendationsState,
      recommendationsMessage: recommendationsMessage ?? this.recommendationsMessage,
      episodes: episodes ?? this.episodes,
      episodesState: episodesState ?? this.episodesState,
      episodesMessage: episodesMessage ?? this.episodesMessage,
      selectedSeason: selectedSeason ?? this.selectedSeason,
    );
  }

  @override
  List<Object?> get props => [
    details,
    detailsState,
    detailsMessage,
    recommendations,
    recommendationsState,
    recommendationsMessage,
    episodes,
    episodesState,
    episodesMessage,
    selectedSeason,
  ];
}
