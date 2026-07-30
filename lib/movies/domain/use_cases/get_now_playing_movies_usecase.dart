import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters>{

  final BaseMoviesRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);


  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getNowPlayingMovies();
  }

}