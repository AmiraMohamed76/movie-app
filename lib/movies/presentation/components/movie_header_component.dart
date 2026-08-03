import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_app/movies/presentation/screens/see_more_movies_screen.dart';

class MovieHeaderComponent extends StatelessWidget {
  final String header;

  const MovieHeaderComponent({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    final isPopular = header == "Popular";

    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                header,
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SeeMoreMoviesScreen(
                        movies: isPopular
                            ? state.popularMovies
                            : state.topRatedMovies,
                        title: isPopular? "Popular Movies" : "Top Rated Movies",
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text('See More', style: TextStyle(color: Colors.white)),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
