import 'package:flutter/material.dart';

import './widgets/MovieCard.dart';
import './models/MovieCard.dart';

void main() => runApp(MyApp());

const APP_NAME = 'WhatToWatch';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: APP_NAME,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(APP_NAME),
          ),
          body: Home(),
        ));
  }
}

class Home extends StatelessWidget {
  final List<MovieCardModel> movieList = [
    MovieCardModel(
        name: 'Harry potter',
        image:
            'https://image.tmdb.org/t/p/w500//wlfDxbGEsW58vGhFljKkcR5IxDj.jpg'),
    MovieCardModel(
        name: 'Harry potter',
        image:
            'https://image.tmdb.org/t/p/w500//wlfDxbGEsW58vGhFljKkcR5IxDj.jpg'),
    MovieCardModel(
        name: 'Harry potter',
        image:
            'https://image.tmdb.org/t/p/w500//wlfDxbGEsW58vGhFljKkcR5IxDj.jpg'),
    MovieCardModel(
        name: 'Harry potter',
        image:
            'https://image.tmdb.org/t/p/w500//wlfDxbGEsW58vGhFljKkcR5IxDj.jpg'),
    MovieCardModel(
        name: 'Harry potter',
        image:
            'https://image.tmdb.org/t/p/w500//wlfDxbGEsW58vGhFljKkcR5IxDj.jpg'),
    MovieCardModel(
        name: 'Harry potter',
        image:
            'https://image.tmdb.org/t/p/w500//wlfDxbGEsW58vGhFljKkcR5IxDj.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return GridView.count(
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: 2,
        children: List.generate(movieList.length, (index) {
          return MovieCard(movieList[index].image);
        }));
  }
}
