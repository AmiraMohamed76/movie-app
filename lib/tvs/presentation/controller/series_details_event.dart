part of 'series_details_bloc.dart';

sealed class SeriesDetailsEvent extends Equatable{}

class GetSeriesDetailsEvent extends SeriesDetailsEvent{
  final int seriesId;

  GetSeriesDetailsEvent({required this.seriesId});

  @override
  List<Object?> get props => [seriesId];
}

class GetSeriesRecommendationEvent extends SeriesDetailsEvent{
  final int seriesId;

  GetSeriesRecommendationEvent({required this.seriesId});

  @override
  List<Object?> get props => [seriesId];
}

class GetSeasonEpisodesEvent extends SeriesDetailsEvent{
  final int seriesId;
  final int seasonNumber;

  GetSeasonEpisodesEvent({required this.seriesId, required this.seasonNumber});

  @override
  List<Object?> get props => [seriesId];
}

class ChangeSeasonEvent extends SeriesDetailsEvent{
  final int seasonNumber;

  ChangeSeasonEvent({required this.seasonNumber});

  @override
  List<Object?> get props => [seasonNumber];
}
