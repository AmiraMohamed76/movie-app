import 'package:equatable/equatable.dart';

class SeriesRecommendation extends Equatable{
  final int id;
  final String? backdropPath;

  const SeriesRecommendation({required this.id, this.backdropPath});

  @override
  List<Object?> get props => [id, backdropPath];
}