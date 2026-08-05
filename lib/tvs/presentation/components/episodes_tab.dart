import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/extensions.dart';
import 'package:movie_app/tvs/domain/entities/episode.dart';
import 'package:movie_app/tvs/presentation/controller/series_details_bloc.dart';
import 'package:shimmer/shimmer.dart';

class EpisodesTab extends StatelessWidget {
  final int seriesId;

  const EpisodesTab({super.key, required this.seriesId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesDetailsBloc, SeriesDetailsState>(
      builder: (context, state) {
        final bloc = context.read<SeriesDetailsBloc>();
        switch(state.episodesState){
          case RequestState.loading:
            return SizedBox(
              height: 170,
              child: Center(child: CircularProgressIndicator.adaptive()),
            );
          case RequestState.loaded:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                children: [
                  DropdownMenu<int>(
                    width: double.infinity,
                    textStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    initialSelection: state.selectedSeason,
                    inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      fillColor: Color(0xff333333),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.grey.shade900),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      ),
                    ),
                    dropdownMenuEntries:
                    state.details?.seasons
                        .map(
                          (e) =>
                          DropdownMenuEntry<int>(
                            value: e.seasonNumber,
                            label: e.name,
                          ),
                    ).toList() ?? [],
                    onSelected: (seasonNumber) {
                      if (seasonNumber != null) {
                        bloc.add(
                          GetSeasonEpisodesEvent(
                            seriesId: seriesId,
                            seasonNumber: seasonNumber,
                          ),
                        );
                        bloc.add(
                          ChangeSeasonEvent(seasonNumber: seasonNumber),
                        );
                      }
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.episodes.length,
                      itemBuilder: (BuildContext context, int index) {
                        final episode = state.episodes[index];
                        return EpisodeItem(episode: episode);
                      },
                    ),
                  ),
                ],
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 400,
              child: Center(child: Text(state.episodesMessage)),
            );
        }

      },
    );
  }
}

class EpisodeItem extends StatelessWidget {
  final Episode episode;

  const EpisodeItem({super.key,required this.episode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: 80.0,
                width: 150.0,
                fit: BoxFit.cover,
                imageUrl: ApiConstance.imageUrl(episode.stillPath),
                placeholder: (context, url) =>
                    Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
            SizedBox(width: 6.0),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' ${episode.episodeNumber}. ${episode.name}',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,

                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    children: [
                      Text(
                        " ${episode.airDate.toFormattedDate()}",
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Text(
          episode.overview,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
