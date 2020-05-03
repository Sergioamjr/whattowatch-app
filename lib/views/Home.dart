import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './../models/MoviesResponse.dart';
import './../widgets/MovieCard.dart';
import './../widgets/GenresOptions.dart';

import './../template.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Template(view: () => Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<MoviesResponse> movies;
  int genreId = 0;

  @override
  void initState() {
    super.initState();
    movies = fetchMovies();
  }

  Future<MoviesResponse> fetchMovies() async {
    const urlToFetch =
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&api_key=a1dc06d0f8d65b34ac156d07fe333060&page=1';

    var response = await http.get(urlToFetch);
    return MoviesResponse.fromJson(json.decode(response.body));
  }

  Future<MoviesResponse> fetchMoviesByGenreId(num id) async {
    setState(() {
      return genreId = id;
    });
    print(this.genreId);
    final urlToFetch =
        'https://api.themoviedb.org/3/discover/movie?api_key=a1dc06d0f8d65b34ac156d07fe333060&with_genres=${id}&page=1';

    var response = await http.get(urlToFetch);
    return MoviesResponse.fromJson(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return FutureBuilder(
        future: movies,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                GenresOptions(fetchMoviesByGenreId),
                Container(
                  child: Expanded(
                      child: GridView.count(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisCount: 2,
                          children: List.generate(snapshot.data.results.length,
                              (index) {
                            return MovieCard(
                                snapshot.data.results[index].posterPath);
                          }))),
                )
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Opss tivemos um erro');
          }

          return Center(child: CircularProgressIndicator());
        });
  }
}

// GridView.count(
//         childAspectRatio: (itemWidth / itemHeight),
//         crossAxisCount: 2,
//         children: List.generate(movieList.length, (index) {
//           return MovieCard(movieList[index].image);
//         }));
