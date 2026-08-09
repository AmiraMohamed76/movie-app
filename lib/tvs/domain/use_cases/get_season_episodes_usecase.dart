import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/tvs/domain/entities/episode.dart';
import 'package:movie_app/tvs/domain/repository/base_series_repository.dart';

class GetSeasonEpisodesUseCase
    extends BaseUseCase<List<Episode>, SeasonEpisodeParameters> {
  final BaseSeriesRepository baseSeriesRepository;

  GetSeasonEpisodesUseCase({required this.baseSeriesRepository});

  @override
  Future<Either<Failure, List<Episode>>> call(
    SeasonEpisodeParameters parameters,
  ) async {
    return await baseSeriesRepository.getSeasonEpisodes(parameters);
  }
}

class SeasonEpisodeParameters extends Equatable {
  final int seriesId;
  final int seasonNumber;

  const SeasonEpisodeParameters({
    required this.seriesId,
    required this.seasonNumber,
  });

  @override
  List<Object> get props => [seriesId, seasonNumber];
}
