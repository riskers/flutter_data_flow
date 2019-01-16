import 'package:flutter/material.dart';
import 'search.dart';
import 'userlist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Data Flow'),
        ),
        body: Column(
          children: <Widget>[
            Search(),
            Expanded(
              child: UserList(),
            )
          ],
        ),
      ),
    );
  }
}

