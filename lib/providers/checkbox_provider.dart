import 'package:flutter/foundation.dart';

class CheckBoxProvider with ChangeNotifier {
  bool _isActive = false;
  bool get isActive => _isActive;

  void setValue(bool value) {
    _isActive = value;
    notifyListeners();
  }
}
