import 'package:flutter/cupertino.dart';

class GpsPosProvider extends ChangeNotifier {
  (int, int) get pos => (_x, _y);

  int _x = 0;
  int _y = 0;

  void setPosition((int, int) pos) {
    _x = pos.$1;
    _y = pos.$2;

    notifyListeners();
  }
}
