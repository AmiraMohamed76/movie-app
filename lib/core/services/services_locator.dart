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

final sl = GetIt.instance; //sl => Service Locator  // make it global to use around th whole project


class ServicesLocator {
  void init() {

    ///  lazy => mean to initialize object when need it | without lazy => create object when calling sl in main when app starts

    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl())); /// registerFactory => create new object from class (Movies Bloc)  | registerLazySingleton => create same object (Sigleton)
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    /// UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl())); /// UseCase needs object fron repo => i sent sl() (object from service locator) because sl has object from repo
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl())); /// MoviesRepo needs object fron data source => i sent sl() (object from service locator) because sl has object from data source

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

  }
}