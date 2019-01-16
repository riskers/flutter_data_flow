import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({this.text});

  final String text;

  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search> {
  final editController = TextEditingController();

  void _submit(String input) {
    print(input);
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