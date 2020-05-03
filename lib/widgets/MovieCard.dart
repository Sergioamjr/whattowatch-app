import 'package:flutter/material.dart';

import './../models/AppConfig.dart';

class MovieCard extends StatelessWidget {
  final image;
  final app = AppConfig();

  MovieCard(this.image);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      child: Image.network(
        "${app.image}${this.image}",
        fit: BoxFit.cover,
      ),
    ));
  }
}
