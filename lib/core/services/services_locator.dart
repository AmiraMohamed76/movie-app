import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_connection/dio_config.dart';
import 'package:movie_app/core/network/dio_connection/dio_service.dart';
import 'package:movie_app/movies/data/data_source/remote/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_recommendation_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_app/tvs/data/data_source/remote/series_remote_data_source.dart';
import 'package:movie_app/tvs/data/repository/series_repository.dart';
import 'package:movie_app/tvs/domain/repository/base_series_repository.dart';
import 'package:movie_app/tvs/domain/use_cases/get_on_air_series_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_popular_series_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_season_episodes_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_series_details_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_series_recommendation_usecase.dart';
import 'package:movie_app/tvs/domain/use_cases/get_top_rated_series_usecase.dart';
import 'package:movie_app/tvs/presentation/controller/series_bloc.dart';
import 'package:movie_app/tvs/presentation/controller/series_details_bloc.dart';

final sl = GetIt
    .instance; //sl => Service Locator  // make it global to use around th whole project

class ServicesLocator {
  void init() {
    ///  lazy => mean to initialize object when need it | without lazy => create object when calling sl in main when app starts

    /// Repository
    /// /// MoviesRepo needs object fron data source => i sent sl() (object from service locator) because sl has object from data source
    sl.registerLazySingleton<BaseMoviesRepository>(
          () => MoviesRepository(baseMovieRemoteDataSource: sl()),
    );
    sl.registerLazySingleton<BaseSeriesRepository>(
          () => SeriesRepository(baseSeriesRemoteDataSource: sl()),
    );

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
          () => MovieRemoteDataSource(dioClient: sl()),
    );
    sl.registerLazySingleton<BaseSeriesRemoteDataSource>(
          () => SeriesRemoteDataSource(dioClient: sl()),
    );

    /// Dio
    sl.registerLazySingleton<Dio>(() => DioFactory.create());
    sl.registerLazySingleton<BaseDioClient>(() => DioClient(dio: sl()));

    /// Bloc
    /// /// registerFactory => create new object from class (Movies Bloc)  | registerLazySingleton => create same object (Sigleton)
    sl.registerFactory(
      () => MoviesBloc(
        getNowPlayingMoviesUseCase: sl(),
        getPopularMoviesUseCase: sl(),
        getTopRatedMoviesUseCase: sl(),
      ),
    );
    sl.registerFactory(
      () => MovieDetailsBloc(
        getMovieDetailsUseCase: sl(),
        getRecommendationUseCase: sl(),
      ),
    );
    sl.registerFactory(
      () => SeriesBloc(
        getOnAirSeriesUseCase: sl(),
        getPopularSeriesUseCase: sl(),
        getTopRatedSeriesUseCase: sl(),
      ),
    );
    sl.registerFactory(
      () => SeriesDetailsBloc(
        getSeasonEpisodesUseCase: sl(),
        getSeriesDetailsUseCase: sl(),
        getSeriesRecommendationUseCase: sl(),
      ),
    );

    /// UseCases
    /// /// UseCase needs object fron repo => i sent sl() (object from service locator) because sl has object from repo
    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(baseMovieRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetPopularMoviesUseCase(baseMovieRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetTopRatedMoviesUseCase(baseMovieRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetMovieDetailsUseCase(baseMoviesRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetRecommendationUseCase(baseMoviesRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetOnAirSeriesUseCase(baseSeriesRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetPopularSeriesUseCase(baseSeriesRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetTopRatedSeriesUseCase(baseSeriesRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetSeriesDetailsUseCase(baseSeriesRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetSeriesRecommendationUseCase(baseSeriesRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetSeasonEpisodesUseCase(baseSeriesRepository: sl()),
    );

  }
}
