import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/tvs/data/data_source/remote/series_remote_data_source.dart';
import 'package:movie_app/tvs/domain/entities/episode.dart';
import 'package:movie_app/tvs/domain/entities/series.dart';
import 'package:movie_app/tvs/domain/entities/series_details.dart';
import 'package:movie_app/tvs/domain/entities/series_recommendation.dart';
import 'package:movie_app/tvs/domain/repository/base_series_repository.dart';
import 'package:movie_app/tvs/domain/use_cases/get_season_episodes_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_series_details_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_series_recommendation_usecase.dart';

class SeriesRepository extends BaseSeriesRepository {
  final BaseSeriesRemoteDataSource baseSeriesRemoteDataSource;

  SeriesRepository({required this.baseSeriesRemoteDataSource});

  @override
  Future<Either<Failure, List<Series>>> getOnAirSeries() async {
    final result = await baseSeriesRemoteDataSource.getOnAirSeries();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getPopularSeries() async {
    final result = await baseSeriesRemoteDataSource.getPopularSeries();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getTopRatedSeries() async {
    final result = await baseSeriesRemoteDataSource.getTopRatedSeries();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SeriesDetails>> getSeriesDetails(
    SeriesDetailsParameters parameters,
  ) async {
    final result = await baseSeriesRemoteDataSource.getSeriesDetails(
      parameters,
    );

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<SeriesRecommendation>>> getSeriesRecommendation(
    SeriesRecommendationParameters parameters,
  ) async {
    final result = await baseSeriesRemoteDataSource.getSeriesRecommendations(
      parameters,
    );

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Episode>>> getSeasonEpisodes(
    SeasonEpisodeParameters parameters,
  ) async {
    final result = await baseSeriesRemoteDataSource.getSeasonEpisodes(
      parameters,
    );

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
