import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final image;

  MovieCard(this.image);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      child: Image.network(
        "https://image.tmdb.org/t/p/w500${this.image}",
        fit: BoxFit.cover,
      ),
    ));
  }
}

// Image.network(
//   this.image,
//   filterQuality: FilterQuality.low,
//   fit: BoxFit.contain,
// ),
