import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('search page'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'A'),
              Tab(text: 'B'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('AAAA')
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('BBB')
            )
          ],
        ),
      )
    );
  }
}
