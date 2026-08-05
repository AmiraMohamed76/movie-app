import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/tvs/presentation/components/episodes_tab.dart';
import 'package:movie_app/tvs/presentation/components/more_like_that_tab.dart';
import 'package:movie_app/tvs/presentation/components/series_details_component.dart';
import 'package:movie_app/tvs/presentation/controller/series_details_bloc.dart';

class SeriesDetailsScreen extends StatelessWidget {
  final int id;

  const SeriesDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SeriesDetailsBloc>()
        ..add(GetSeriesDetailsEvent(seriesId: id))
        ..add(GetSeriesRecommendationEvent(seriesId: id))
        ..add(GetSeasonEpisodesEvent(seriesId: id, seasonNumber: 1)),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(body: SeriesDetailContent(id: id)),
      ),
    );
  }
}

class SeriesDetailContent extends StatelessWidget {
  final int id;

  const SeriesDetailContent({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: const Key('movieDetailScrollView'),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const SeriesDetailsComponent(),

          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarDelegate(
              TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicator: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.deepOrange, width: 4),
                  ),
                ),
                tabs: [
                  Tab(text: 'Episodes'.toUpperCase()),
                  Tab(text: 'More like this'.toUpperCase()),
                ],
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        children: [
          EpisodesTab(seriesId: id),
          const MoreLikeThatTab(),
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return Container(
      color: Colors.transparent,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) {
    return false;
  }
}
