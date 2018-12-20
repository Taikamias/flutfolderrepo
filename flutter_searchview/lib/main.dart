import 'package:flutter/material.dart';

import './pages/nav_page.dart';

void main() => runApp(new MyApp());

//Our MyApp class. Represents our application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView SearchView",
      home: new HomePage(),
      theme: ThemeData(primaryColor: Color.fromRGBO(85, 122, 149, 1)),
      debugShowCheckedModeBanner: false,
    );
  }
}
