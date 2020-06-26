import 'package:flutter/material.dart';

import './searcher.dart';



void main() => runApp(Finder());




class Finder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Price Finder",
      home: Searcher()
    );
  }
}






