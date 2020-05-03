import 'package:flutter/material.dart';
import './../models/Genres.dart';

class GenresOptions extends StatelessWidget {
  final Function redirectToGenre;
  GenresOptions(this.redirectToGenre);

  final options = Genres().all;

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
                  ...options.asMap().entries.map((entry) {
                    final addMargin = options.length - 1 != entry.key;
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
