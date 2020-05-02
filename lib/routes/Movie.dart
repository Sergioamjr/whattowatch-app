import 'package:flutter/material.dart';

import './../views/Movie.dart';
import './../models/AppConfig.dart';

class SingleGenre extends StatelessWidget {
  final app = AppConfig();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: app.getAppName(),
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(app.getAppName()),
          ),
          body: Movie(),
        ));
  }
}
