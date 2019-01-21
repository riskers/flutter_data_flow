import 'package:flutter_data_flow/pages/home/flow/constants.dart';
import 'package:flutter_data_flow/store/store.dart';

AppState searchUserList(AppState state, dynamic action) {
  switch (action['type']) {
    case SEARCH_USER_LIST_LOADING:
      return state.copyWith(
        loading: true,
      );
    case SEARCH_USER_LIST_SUCCESS:
      return state.copyWith(
        list: action['list'],
        loading: false,
      );
  }

  return state;
}
