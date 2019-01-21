import 'package:flutter/material.dart';
import 'package:flutter_data_flow/pages/home/search_input.dart';
import 'package:flutter_data_flow/pages/home/search_user_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = [];

    return Scaffold(
      appBar: AppBar(
        title: Text('data flow'),
      ),
      body: Column(
        children: <Widget>[
          SearchInput(),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return SearchUserItem(
                  username: item['username'],
                  avatar: item['avatar'],
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
