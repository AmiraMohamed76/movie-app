import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/tvs/domain/entities/series.dart';
import 'package:movie_app/tvs/presentation/components/series_item_component.dart';

class SeeMoreScreen extends StatelessWidget {
  final List<Series> series;
  final String title;

  const SeeMoreScreen({super.key, required this.series, required this.title});

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
        itemCount: series.length,
        itemBuilder: (BuildContext context, int index) {
          final seriesItem = series[index];
          return SeriesItemComponent(series: seriesItem);
        },
      ),
    );
  }
}
