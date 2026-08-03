import 'package:get_it/get_it.dart';
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
import 'package:movie_app/tvs/domain/use_cases/get_top_rated_series_usecase.dart';
import 'package:movie_app/tvs/presentation/controller/series_bloc.dart';

final sl = GetIt.instance; //sl => Service Locator  // make it global to use around th whole project


class ServicesLocator {
  void init() {

    ///  lazy => mean to initialize object when need it | without lazy => create object when calling sl in main when app starts

    /// Bloc
    /// /// registerFactory => create new object from class (Movies Bloc)  | registerLazySingleton => create same object (Sigleton)
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    sl.registerFactory(() => SeriesBloc(sl(), sl(), sl()));

    /// UseCases
    /// /// UseCase needs object fron repo => i sent sl() (object from service locator) because sl has object from repo
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    sl.registerLazySingleton(() => GetOnAirSeriesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularSeriesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedSeriesUseCase(sl()));

    /// Repository
    /// /// MoviesRepo needs object fron data source => i sent sl() (object from service locator) because sl has object from data source
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
    sl.registerLazySingleton<BaseSeriesRepository>(() => SeriesRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    sl.registerLazySingleton<BaseSeriesRemoteDataSource>(() => SeriesRemoteDataSource());

  }
}