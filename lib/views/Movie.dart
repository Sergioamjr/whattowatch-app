import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './../template.dart';
import './../models/AppConfig.dart';
import './../models/MoviesResponse.dart';

class MovieRoute extends StatelessWidget {
  static const routeName = '/movie';
  @override
  Widget build(BuildContext context) {
    return Template(view: () => Movie());
  }
}

class Movie extends StatelessWidget {
  final app = AppConfig();
  @override
  Widget build(BuildContext context) {
    final Results movie = ModalRoute.of(context).settings.arguments;
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView(
        children: <Widget>[
          Image.network(
            "${app.image}${movie.backdropPath}",
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            movie.originalTitle,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 51, 51, 51)),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Description(
                description: 'Ação, comédia',
                subtitle: 'Genres',
              ),
              Description(
                description: DateFormat.yMMMd()
                    .format(DateTime.parse(movie.releaseDate)),
                subtitle: 'Release Date',
              ),
              Description(
                description: movie.voteAverage.toString(),
                subtitle: 'IMDB',
              ),
            ],
          ),
          Description(
            description: movie.overview,
            subtitle: 'Overview',
            alignment: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String subtitle;
  final String description;
  final alignment;

  Description(
      {this.subtitle, this.description, this.alignment = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          this.subtitle,
          style: TextStyle(color: Colors.black45),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          this.description,
          style:
              TextStyle(fontSize: 18, color: Color.fromARGB(255, 51, 51, 51)),
          textAlign: alignment,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
