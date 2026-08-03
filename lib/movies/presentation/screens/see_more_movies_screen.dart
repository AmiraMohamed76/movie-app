import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/presentation/components/movie_item_component.dart';

class SeeMoreMoviesScreen extends StatelessWidget {
  final List<Movie> movies;
  final String title;

  const SeeMoreMoviesScreen({super.key, required this.movies, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          return MovieItemComponent(movie: movie);
        },
      ),
    );
  }
}
