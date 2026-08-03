part of 'series_bloc.dart';

sealed class SeriesEvent {}

class GetOnAirSeriesEvent extends SeriesEvent{}
class GetPopularSeriesEvent extends SeriesEvent{}
class GetTopRatedSeriesEvent extends SeriesEvent{}
