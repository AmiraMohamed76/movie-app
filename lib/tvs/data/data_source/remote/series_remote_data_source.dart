import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/tvs/data/models/episode_model.dart';
import 'package:movie_app/tvs/data/models/series_details_model.dart';
import 'package:movie_app/tvs/data/models/series_model.dart';
import 'package:movie_app/tvs/data/models/series_recommendation_model.dart';
import 'package:movie_app/tvs/domain/use_cases/get_season_episodes_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_series_details_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_series_recommendation_usecase.dart';

abstract class BaseSeriesRemoteDataSource {
  Future<List<SeriesModel>> getOnAirSeries();

  Future<List<SeriesModel>> getPopularSeries();

  Future<List<SeriesModel>> getTopRatedSeries();

  Future<SeriesDetailsModel> getSeriesDetails(
    SeriesDetailsParameters parameters,
  );

  Future<List<SeriesRecommendationModel>> getSeriesRecommendations(
    SeriesRecommendationParameters parameters,
  );

  Future<List<EpisodeModel>> getSeasonEpisodes(
    SeasonEpisodeParameters parameters,
  );
}

class SeriesRemoteDataSource extends BaseSeriesRemoteDataSource {
  @override
  Future<List<SeriesModel>> getOnAirSeries() async {
    final response = await Dio().get(ApiConstance.onAirSeriesPath);

    if (response.statusCode == 200) {
      return List<SeriesModel>.from(
        response.data['results'].map((e) => SeriesModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<SeriesModel>> getPopularSeries() async {
    final response = await Dio().get(ApiConstance.popularSeriesPath);

    if (response.statusCode == 200) {
      return List<SeriesModel>.from(
        response.data['results'].map((e) => SeriesModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<SeriesModel>> getTopRatedSeries() async {
    final response = await Dio().get(ApiConstance.topRatedSeriesPath);

    if (response.statusCode == 200) {
      return List<SeriesModel>.from(
        response.data['results'].map((e) => SeriesModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<SeriesDetailsModel> getSeriesDetails(
    SeriesDetailsParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstance.seriesDetailsPath(parameters.seriesId),
    );

    if (response.statusCode == 200) {
      return SeriesDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<SeriesRecommendationModel>> getSeriesRecommendations(
    SeriesRecommendationParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstance.seriesRecommendationsPath(parameters.seriesId),
    );

    if (response.statusCode == 200) {
      return List<SeriesRecommendationModel>.from(
        response.data['results'].map(
          (e) => SeriesRecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<EpisodeModel>> getSeasonEpisodes(
    SeasonEpisodeParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstance.seriesSeasonEpisodes(
        parameters.seriesId,
        parameters.seasonNumber,
      ),
    );

    if (response.statusCode == 200) {
      return List<EpisodeModel>.from(
        response.data['episodes'].map((e) => EpisodeModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
