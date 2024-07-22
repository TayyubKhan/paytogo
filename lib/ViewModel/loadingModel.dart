import 'package:flutter/cupertino.dart';

class LoadingViewModel with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  void isLoading() {
    _loading = !loading;
    notifyListeners();
  }
}
