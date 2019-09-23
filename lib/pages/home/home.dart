import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './components/search_input.dart';
import './components/search_user_item.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List _list = [];
  bool _loading = false;

  onSearch(String name) async {
    setState(() {
      _loading = true;
    });

    // 模拟延迟
    await Future.delayed(Duration(seconds: 2));

    Dio dio = Dio();
    Response response = await dio.get('https://api.github.com/search/users?q=$name&page=1');

    List list = response.data['items'].map((item) {
      return {
        'username': item['login'],
        'avatar': item['avatar_url'],
      };
    }).toList();

    setState(() {
      _list = list;
      _loading = false;
    });
  }

  Widget _renderContent() {
    if (_loading) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          final item = _list[index];

          return SearchUserItem(
            username: item['username'],
            avatar: item['avatar'],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('data flow'),
        ),
        body: Column(
          children: <Widget>[
            SearchInput(onSearch),
            _renderContent(),
          ],
        ));
  }
}
