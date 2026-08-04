import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/movies/presentation/components/movie_header_component.dart';
import 'package:movie_app/movies/presentation/components/now_playing_component.dart';
import 'package:movie_app/movies/presentation/components/popular_component.dart';
import 'package:movie_app/movies/presentation/components/top_rated_component.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              MovieHeaderComponent(header:  "Popular"),
              const PopularComponent(),
              MovieHeaderComponent(header:  "Top Rated"),
              const TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
