import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/tvs/presentation/components/series_header_component.dart';
import 'package:movie_app/tvs/presentation/components/on_air_component.dart';
import 'package:movie_app/tvs/presentation/components/popular_series_component.dart';
import 'package:movie_app/tvs/presentation/components/top_rated_series_component.dart';
import 'package:movie_app/tvs/presentation/controller/series_bloc.dart';
import 'package:movie_app/tvs/presentation/screens/see_more_screen.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SeriesBloc>()
        ..add(GetOnAirSeriesEvent())
        ..add(GetPopularSeriesEvent())
        ..add(GetTopRatedSeriesEvent()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SingleChildScrollView(
              key: const Key('movieScrollView'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OnAirComponent(),
                  SeriesHeaderComponent(header: "Popular"),
                  const PopularSeriesComponent(),
                  SeriesHeaderComponent(header:  "Top Rated"),
                  const TopRatedSeriesComponent(),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
