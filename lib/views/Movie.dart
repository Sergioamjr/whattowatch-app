import 'package:flutter/material.dart';

import './../routes/Home.dart';

class Movie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Voltar'),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      },
    );
  }
}
