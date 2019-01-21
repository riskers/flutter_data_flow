import 'package:flutter/material.dart';
import 'package:flutter_data_flow/pages/search_result/search_result.dart';

class SearchUserList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchUserListState();
  }
}

class _SearchUserListState extends State<SearchUserList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: <Widget>[
        Item(username: 'risker', avatar: 'https://images.unsplash.com/photo-1504194921103-f8b80cadd5e4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80'),
        Item(username: 'zxc', avatar: 'https://images.unsplash.com/photo-1504194921103-f8b80cadd5e4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80',),
        Item(username: 'df', avatar: 'https://images.unsplash.com/photo-1504194921103-f8b80cadd5e4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80',),
      ],
    );
  }
}

class Item extends StatelessWidget {
  final String username;
  final String avatar;

  Item({
    this.username,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return
        ListTile(
          title: Text(username),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(avatar),
          ),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SearchResult()),
            );
          },
        );
  }
}
