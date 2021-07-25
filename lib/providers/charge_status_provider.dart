import 'package:flutter/material.dart';

class ChargingStatusProvider extends ChangeNotifier {
  bool chargingStatus = false;

  bool get startCharging => startCharging == true;

  void toggleCharging(bool isOn) {
    chargingStatus = isOn ? true : false;
    print(chargingStatus);
    notifyListeners();
  }
}
