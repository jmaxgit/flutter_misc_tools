import 'package:flutter/cupertino.dart';
import 'package:flutter_misc_tools/data.dart';

class SingleNotifier extends ChangeNotifier{
  String _currentVehicle = 'Seleciona el vehículo'; //vehicles[0];
  SingleNotifier();

  String get currentVehicle => _currentVehicle;

  updateVehicle(String value){
    if(value != _currentVehicle)
    {
    _currentVehicle = value;
    notifyListeners();
    }
  }
}