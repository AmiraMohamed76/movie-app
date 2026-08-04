import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/tvs/presentation/controller/series_details_bloc.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesDetailsBloc, SeriesDetailsState>(
      builder: (context, state) {
        return SizedBox(
          height: 250,
          width: double.infinity,
          child: FadeIn(
            duration: const Duration(milliseconds: 500),
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                    Colors.black,
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.5, 1.0, 1.0],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstIn,
              child: CachedNetworkImage(
                imageUrl: ApiConstance.imageUrl(
                  state.details!.backdropPath,
                ),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        );
      },
    );

  }
}
