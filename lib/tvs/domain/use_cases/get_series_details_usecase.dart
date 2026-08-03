import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/tvs/domain/entities/series_details.dart';
import 'package:movie_app/tvs/domain/repository/base_series_repository.dart';

class GetSeriesDetailsUseCase extends BaseUseCase<SeriesDetails, SeriesDetailsParameters> {
  final BaseSeriesRepository baseSeriesRepository;
  GetSeriesDetailsUseCase(this.baseSeriesRepository);

  @override
  Future<Either<Failure, SeriesDetails>> call(SeriesDetailsParameters parameters) async {
    return await baseSeriesRepository.getSeriesDetails(parameters);
  }
}

class SeriesDetailsParameters extends Equatable {
  final int seriesId;

  const SeriesDetailsParameters({required this.seriesId});

  @override
  List<Object> get props => [seriesId];
}