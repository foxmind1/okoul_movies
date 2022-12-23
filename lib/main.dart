import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:okoul_movie/features/favorite_movies/providers/favorite_movies_provider.dart';
import 'package:okoul_movie/features/home/views/home.dart';
import 'package:okoul_movie/services/prefs_services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PrefsServices().initPrefs();
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteMovieProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.greyLaw),
      home: const HomePage(),
    );
  }
}
