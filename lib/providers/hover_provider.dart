import 'package:flutter/foundation.dart';

class TextHoverProvider with ChangeNotifier {
  bool _isHover = false;
  bool get isHover => _isHover;

  void setValue(bool value) {
    _isHover = value;
    notifyListeners();
  }
}
