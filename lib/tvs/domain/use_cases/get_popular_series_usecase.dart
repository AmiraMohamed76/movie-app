import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/tvs/domain/entities/series.dart';
import 'package:movie_app/tvs/domain/repository/base_series_repository.dart';

class GetPopularSeriesUseCase extends BaseUseCase<List<Series>, NoParameters> {
  final BaseSeriesRepository baseSeriesRepository;

  GetPopularSeriesUseCase({required this.baseSeriesRepository});

  @override
  Future<Either<Failure, List<Series>>> call(NoParameters parameters) async{
    return await baseSeriesRepository.getPopularSeries();
  }

}