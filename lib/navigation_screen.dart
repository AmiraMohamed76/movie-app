import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/screens/movies_screen.dart';

import 'tvs/presentation/screens/tv_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    const List<Widget> screens = [MoviesScreen(), TvScreen()];

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 60,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,

        destinations: [
          NavigationDestination(icon: Icon(Icons.movie), label: ''),
          NavigationDestination(icon: Icon(Icons.tv), label: ''),
        ],
      ),
      body: screens[currentPageIndex],
    );
  }
}
