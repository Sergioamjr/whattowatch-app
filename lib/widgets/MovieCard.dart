import 'package:flutter/material.dart';

import './../models/MoviesResponse.dart';
import './../models/AppConfig.dart';
import './../views/Movie.dart';

class MovieCard extends StatelessWidget {
  final Results movie;
  final app = AppConfig();
  MovieCard(this.movie);

  void redictToMovieDetails(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MovieRoute.routeName, arguments: movie);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () => redictToMovieDetails(context),
          child: Container(
            child: Image.network(
              "${app.image}${movie.posterPath}",
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
