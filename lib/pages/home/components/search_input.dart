import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  final onSearch;

  SearchInput(this.onSearch);

  @override
  State<StatefulWidget> createState() {
    return _SearchInputState();
  }
}

class _SearchInputState extends State<SearchInput> {
  final editController = TextEditingController();

  void _submit() {
    widget.onSearch(editController.text);
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
                _submit();
              },
            ),
          ),
          RaisedButton(
            child: Text('Search'),
            onPressed: () {
              _submit();
            },
          ),
        ],
      ),
    );
  }
}
