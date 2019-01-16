import 'package:flutter/material.dart';
import 'search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Data Flow'),
        ),
        body: Container(
          child: Search(text: 'Hi'),
        ),
      ),
    );
  }
}

