import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/tvs/domain/entities/series_recommendation.dart';
import 'package:movie_app/tvs/domain/repository/base_series_repository.dart';

class GetSeriesRecommendationUseCase extends BaseUseCase<List<SeriesRecommendation>, SeriesRecommendationParameters> {
  final BaseSeriesRepository baseSeriesRepository;
  GetSeriesRecommendationUseCase(this.baseSeriesRepository);

  @override
  Future<Either<Failure, List<SeriesRecommendation>>> call(SeriesRecommendationParameters parameters) async {
    return await baseSeriesRepository.getSeriesRecommendation(parameters);
  }
}

class SeriesRecommendationParameters extends Equatable {
  final int seriesId;

  const SeriesRecommendationParameters({required this.seriesId});

  @override
  List<Object> get props => [seriesId];
}
