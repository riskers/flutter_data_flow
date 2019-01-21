import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SearchInput extends StatefulWidget {
  SearchInput();

  @override
  State<StatefulWidget> createState() {
    return _SearchInputState();
  }
}

class _SearchInputState extends State<SearchInput> {
  final editController = TextEditingController();

  void _submit(String input) async {
    Dio dio = Dio();
    Response response = await dio.get('https://api.github.com/search/users?q=$input&page=1');
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: editController,
              onSubmitted: (_) {
                _submit(editController.text);
              },
            ),
          ),
          RaisedButton(
            child: Text('Search'),
            onPressed: () {
              _submit(editController.text);
            },
          ),
        ],
      ),
    );
  }
}
