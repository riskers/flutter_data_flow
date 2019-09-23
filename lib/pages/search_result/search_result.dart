import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SearchResult extends StatefulWidget {
  final String username;

  SearchResult({this.username});

  @override
  State<StatefulWidget> createState() {
    return _SearchResult();
  }
}

class _SearchResult extends State<SearchResult> {
  Future<List<dynamic>> _fetch(String type) async {
    final String name = widget.username;

    // 模拟延迟
    await Future.delayed(Duration(seconds: 2));

    Dio dio = Dio();
    Response response = await dio.get('https://api.github.com/users/$name/$type?page=1');

    List list = response.data.map((item) {
      return {
        'username': item['login'],
        'avatar': item['avatar_url'],
      };
    }).toList();

    return list;
  }

  Widget _renderList(String type) {
    return FutureBuilder(
        future: _fetch(type),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['username']),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data[index]['avatar']),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.username),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'followers'),
                Tab(text: 'followings'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: _renderList('followers'),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: _renderList('following'),
              )
            ],
          ),
        ));
  }
}
