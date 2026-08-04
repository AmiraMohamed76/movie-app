import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/tvs/presentation/controller/series_bloc.dart';
import 'package:movie_app/tvs/presentation/screens/series_details_screen.dart';
import 'package:shimmer/shimmer.dart';


class TopRatedSeriesComponent extends StatelessWidget {
  const TopRatedSeriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesState>(
      buildWhen: (previous, current) =>
          previous.topRatedSeriesState != current.topRatedSeriesState,
      builder: (context, state) {
        switch (state.topRatedSeriesState) {
          case RequestState.loading:
            return SizedBox(
              height: 170,
              child: Center(child: CircularProgressIndicator.adaptive()),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedSeries.length,
                  itemBuilder: (context, index) {
                    final series = state.topRatedSeries[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SeriesDetailsScreen(id: series.id)));
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(series.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 400,
              child: Center(child: Text(state.topRatedSeriesMessage)),
            );
        }
      },
    );
  }
}
