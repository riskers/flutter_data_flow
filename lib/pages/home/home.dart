import 'package:flutter/material.dart';
import 'package:flutter_data_flow/pages/home/search_input.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data flow')
      ),
      body: Material(
        child: SearchInput(),
      ),
    );
  }
}
