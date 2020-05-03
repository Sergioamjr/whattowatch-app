import 'package:flutter/material.dart';

import './models/AppConfig.dart';

class Template extends StatelessWidget {
  final Function view;
  final app = AppConfig();

  Template({@required this.view});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: app.name,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(app.name),
          ),
          body: view(),
        ));
  }
}
