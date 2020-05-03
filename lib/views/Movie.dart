import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './../template.dart';
import './../models/AppConfig.dart';

class MovieRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Template(view: () => Movie());
  }
}

class Movie extends StatelessWidget {
  final app = AppConfig();
  final movieDetails = {
    "popularity": 433.51,
    "vote_count": 3242,
    "video": false,
    "posterPath": "/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg",
    "id": 419704,
    "adult": false,
    "backdropPath": "/5BwqwxMEjeFtdknRV792Svo0K1v.jpg",
    "originalLanguage": "en",
    "originalTitle": "Ad Astra",
    "genreIds": [18, 878],
    "title": "Ad Astra",
    "voteAverage": 6,
    "overview":
        "The near future, a time when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon menaces to destroy life on planet Earth, astronaut Roy McBride undertakes a mission across the immensity of space and its many perils to uncover the truth about a lost expedition that decades before boldly faced emptiness and silence in search of the unknown.",
    "releaseDate": "2019-09-17"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView(
        children: <Widget>[
          Image.network(
            "${app.image}${movieDetails['posterPath']}",
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            movieDetails['originalTitle'],
            style: TextStyle(
                fontSize: 29,
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
                    .format(DateTime.parse(movieDetails['releaseDate'])),
                subtitle: 'Release Date',
              ),
              Description(
                description: movieDetails['voteAverage'].toString(),
                subtitle: 'IMDB',
              ),
            ],
          ),
          Description(
            description: movieDetails['overview'],
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
