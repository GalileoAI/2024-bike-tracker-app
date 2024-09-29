import 'dart:math';

import 'package:flutter/cupertino.dart';

class DriverScreenProvider extends ChangeNotifier {
  DriverScreenProvider();

  double get proximity => _proximity;

  (int, int) get bikePositionRelativeToUser => _bikePosRelToUsr;

  double _proximity = 0;
  (int, int) _bikePosRelToUsr = (0, 0);
  (int, int) _gpsPos = (0, 0);
  (int, int) _bikerPos = (0, 0);

  void setGpsPos((int, int) gpsPos) {
    _gpsPos = gpsPos;
    _calculateProximity();
    _calculateRelativePos();
    notifyListeners();
  }

  void setBikerPos((int, int) bikerPos) {
    _bikerPos = bikerPos;

    _calculateProximity();
    _calculateRelativePos();
    notifyListeners();
  }

  void _calculateProximity() {
    _proximity = sqrt(
      pow(_gpsPos.$1 - _bikerPos.$1, 2) + pow(_gpsPos.$2 - _bikerPos.$2, 2),
    );
  }

  void _calculateRelativePos() {
    _bikePosRelToUsr = (_bikerPos.$1 - _gpsPos.$1, _bikerPos.$2 - _gpsPos.$2);
  }
}
