import 'package:flutter/material.dart';
import 'package:movie_app/core/services/services_locator.dart';

import 'movies/presentation/screens/movies_screen_ui.dart';

void main() {
  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainMoviesScreen()
    );
  }
}

