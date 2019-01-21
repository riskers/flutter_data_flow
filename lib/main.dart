import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_data_flow/pages/home/home.dart';
import 'package:flutter_data_flow/store/store.dart';

void main() {
  final store = Store<AppState>(
    reducers,
    middleware: [thunkMiddleware],
    initialState: AppState.initialState(),
  );

  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Home(),
      ),
    );
  }
}
