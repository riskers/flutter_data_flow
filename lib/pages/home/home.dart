import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_data_flow/store/store.dart';
import './components/search_input.dart';
import './components/search_user_item.dart';
import './model.dart';
import './flow/actions.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (store) {
        return AppStateViewModel(
          state: store.state,
          onSearch: (String name) {
//            print('this is in onSearch');
//            print(name);
            store.dispatch(searchUsers(name));
          },
        );
      },
      builder: (context, AppStateViewModel vm) {
        final List list = vm.state.list;
        print(vm.onSearch);

        return Scaffold(
          appBar: AppBar(
            title: Text('data flow'),
          ),
          body: Column(
            children: <Widget>[
              SearchInput(vm.onSearch),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];

                    return SearchUserItem(
                      username: item['username'],
                      avatar: item['avatar'],
                    );
                  },
                ),
              ),
            ],
          )
        );
      },
    );
  }
}
