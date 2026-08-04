import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/tvs/presentation/controller/series_details_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MoreLikeThatTab extends StatelessWidget {
  const MoreLikeThatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesDetailsBloc, SeriesDetailsState>(
      builder: (context, state) {
        return GridView.builder(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          itemCount: state.recommendations.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final recommendation = state.recommendations[index];
            return FadeInRight(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: CachedNetworkImage(
                  imageUrl: ApiConstance.imageUrl(recommendation.backdropPath!),
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      },
    );
  }

}
