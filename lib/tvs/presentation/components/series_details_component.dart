import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/tvs/domain/entities/series_genres.dart';

import '../controller/series_details_bloc.dart';
import 'app_bar_commponent.dart';

class SeriesDetailsComponent extends StatelessWidget {
  const SeriesDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesDetailsBloc, SeriesDetailsState>(
      builder: (context, state) {
        switch (state.detailsState){

          case RequestState.loading:
            return const SliverToBoxAdapter(
              child: SizedBox(
                height: 170,
                child: Center(child: CircularProgressIndicator.adaptive()),
              ),
            );
          case RequestState.loaded:
            return SliverToBoxAdapter(
              child: FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppBarComponent(),
                      Text(
                        state.details!.title,
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              state.details!.firstAirDate.split('-')[0],
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20.0,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                (state.details!.voteAverage / 2)
                                    .toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                '(${state.details!.voteAverage})',
                                style: const TextStyle(
                                  fontSize: 1.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        state.details!.overview,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Genres: ${_showGenres(state.details!.genres)}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case RequestState.error:
            return SliverToBoxAdapter(
              child: SizedBox(
                height: 400,
                child: Center(child: Text(state.detailsMessage)),
              ),
            );
        }
      },
    );
  }

  String _showGenres(List<SeriesGenres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
