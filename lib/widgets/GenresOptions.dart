import 'package:flutter/material.dart';

import './../routes/Movie.dart';

class GenresOptions extends StatelessWidget {
  final Function redirectToGenre;
  GenresOptions(this.redirectToGenre);

  final options = {
    "genres": [
      {"id": 0, "name": "All"},
      {"id": 28, "name": "Action"},
      {"id": 12, "name": "Adventure"},
      {"id": 16, "name": "Animation"},
      {"id": 35, "name": "Comedy"},
      {"id": 80, "name": "Crime"},
      {"id": 99, "name": "Documentary"},
      {"id": 18, "name": "Drama"},
      {"id": 10751, "name": "Family"},
      {"id": 14, "name": "Fantasy"},
      {"id": 36, "name": "History"},
      {"id": 27, "name": "Horror"},
      {"id": 10402, "name": "Music"},
      {"id": 9648, "name": "Mystery"},
      {"id": 10749, "name": "Romance"},
      {"id": 878, "name": "Science Fiction"},
      {"id": 10770, "name": "TV Movie"},
      {"id": 53, "name": "Thriller"},
      {"id": 10752, "name": "War"},
      {"id": 37, "name": "Western"}
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              height: 40,
              child: ListView(
                children: <Widget>[
                  ...options['genres'].asMap().entries.map((entry) {
                    final addMargin = options['genres'].length - 1 != entry.key;
                    return Container(
                      margin: EdgeInsets.only(right: addMargin ? 15 : 0),
                      child: RaisedButton(
                        color: Colors.green,
                        child: Text(
                          entry.value['name'],
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () =>
                            this.redirectToGenre(entry.value['id']),
                      ),
                    );
                  }).toList()
                ],
                scrollDirection: Axis.horizontal,
              )),
        ],
      ),
    );
  }
}
