import 'package:flutter_data_flow/store/store.dart';

class AppStateViewModel {
  final AppState state;
  final void Function(String name) onSearch;

  AppStateViewModel({
    this.state,
    this.onSearch,
  });
}
