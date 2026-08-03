import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/tvs/domain/entities/series.dart';
import 'package:movie_app/tvs/domain/entities/series_details.dart';
import 'package:movie_app/tvs/domain/entities/series_recommendation.dart';
import 'package:movie_app/tvs/domain/use_cases/get_series_details_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_series_recommendation_usecase.dart';

abstract class BaseSeriesRepository {

  Future<Either<Failure, List<Series>>> getOnAirSeries();
  Future<Either<Failure, List<Series>>> getPopularSeries();
  Future<Either<Failure, List<Series>>> getTopRatedSeries();
  Future<Either<Failure, SeriesDetails>> getSeriesDetails(SeriesDetailsParameters parameters);
  Future<Either<Failure, List<SeriesRecommendation>>> getSeriesRecommendation(SeriesRecommendationParameters parameters);


}