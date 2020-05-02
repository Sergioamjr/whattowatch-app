import 'package:flutter/material.dart';

import './views/Home.dart';

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
