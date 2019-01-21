import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:dio/dio.dart';
import 'constants.dart';

ThunkAction searchUsers(String name) {

  return (Store store) async {
    store.dispatch({
      'type': SEARCH_USER_LIST_LOADING,
    });

    await Future.delayed(Duration(seconds: 3));

    Dio dio = Dio();
    Response response = await dio.get('https://api.github.com/search/users?q=$name&page=1');
    List list = response.data['items'].map((item) {
      return {
        'username': item['login'],
        'avatar': item['avatar_url'],
      };
    }).toList();

    store.dispatch({
      'type':SEARCH_USER_LIST_SUCCESS,
      'list': list,
    });
  };
}


