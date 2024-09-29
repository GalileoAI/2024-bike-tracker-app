import 'dart:math';

import 'package:flutter/cupertino.dart';

class DriverScreenProvider extends ChangeNotifier {
  DriverScreenProvider();

  (int, int) _gpsPos = (0, 0);
  (int, int) _bikerPos = (0, 0);

  double get proximity => sqrt(
        pow(_gpsPos.$1 - _bikerPos.$1, 2) + pow(_gpsPos.$2 - _bikerPos.$2, 2),
      );

  (int, int) get bikeToUserVector =>
      (_bikerPos.$1 - _gpsPos.$1, _bikerPos.$2 - _gpsPos.$2);

  void setGpsPos((int, int) gpsPos) {
    _gpsPos = gpsPos;
    notifyListeners();
  }

  void setBikerPos((int, int) bikerPos) {
    _bikerPos = bikerPos;
    notifyListeners();
  }
}
