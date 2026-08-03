part of 'series_bloc.dart';

class SeriesState extends Equatable {
  final List<Series> onAirSeries;
  final RequestState onAirSeriesState;
  final String onAirSeriesMessage;
  final List<Series> popularSeries;
  final RequestState popularSeriesState;
  final String popularSeriesMessage;
  final List<Series> topRatedSeries;
  final RequestState topRatedSeriesState;
  final String topRatedSeriesMessage;

  const SeriesState({
    this.onAirSeries = const [],
    this.onAirSeriesState = RequestState.loading,
    this.onAirSeriesMessage = '',
    this.popularSeries = const [],
    this.popularSeriesState = RequestState.loading,
    this.popularSeriesMessage = '',
    this.topRatedSeries = const [],
    this.topRatedSeriesState = RequestState.loading,
    this.topRatedSeriesMessage = '',
  });

  SeriesState copyWith({
    List<Series>? onAirSeries,
    RequestState? onAirSeriesState,
    String? onAirSeriesMessage,
    List<Series>? popularSeries,
    RequestState? popularSeriesState,
    String? popularSeriesMessage,
    List<Series>? topRatedSeries,
    RequestState? topRatedSeriesState,
    String? topRatedSeriesMessage,
  }) {
    return SeriesState(
      onAirSeries: onAirSeries ?? this.onAirSeries,
      onAirSeriesState: onAirSeriesState ?? this.onAirSeriesState,
      onAirSeriesMessage: onAirSeriesMessage ?? this.onAirSeriesMessage,
      popularSeries: popularSeries ?? this.popularSeries,
      popularSeriesState: popularSeriesState ?? this.popularSeriesState,
      popularSeriesMessage: popularSeriesMessage ?? this.popularSeriesMessage,
      topRatedSeries: topRatedSeries ?? this.topRatedSeries,
      topRatedSeriesState: topRatedSeriesState ?? this.topRatedSeriesState,
      topRatedSeriesMessage: topRatedSeriesMessage ?? this.topRatedSeriesMessage,
    );
  }

  @override
  List<Object> get props => [
    onAirSeries,
    onAirSeriesState,
    onAirSeriesMessage,
    popularSeries,
    popularSeriesState,
    popularSeriesMessage,
    topRatedSeries,
    topRatedSeriesState,
    topRatedSeriesMessage,
  ];
}
