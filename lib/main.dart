import 'package:flutter/material.dart';

import './models/AppConfig.dart';
import './views/Movie.dart';
import './views/Home.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  final app = AppConfig();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: app.appName,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        HomeRoute.routeName: (ctx) => HomeRoute(),
        MovieRoute.routeName: (ctx) => MovieRoute(),
      },
    );
  }
}
