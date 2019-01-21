import 'package:flutter/material.dart';
import 'package:flutter_data_flow/pages/search_result/search_result.dart';

class SearchUserItem extends StatelessWidget {
  final String username;
  final String avatar;

  SearchUserItem({
    Key key,
    @required this.username,
    @required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
