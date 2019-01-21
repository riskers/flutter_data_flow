import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:flutter_data_flow/pages/home/flow/reducers.dart';

class User {
  final String username;
  final String avatar;

  User({
    @required this.username,
    @required this.avatar,
  });
}

class AppState {
  final bool loading;
  final List list;

  AppState({
    this.loading,
    this.list,
  });

  AppState copyWith({bool loading, List list}) {
    return AppState(
      loading: loading ?? this.loading,
      list: list ?? this.list,
    );
  }

  static AppState initialState() {
    return AppState(
      loading: false,
      list: List.unmodifiable([]),
    );
  }
}

final reducers = combineReducers<AppState>([
  searchUserList,
]);
