import 'package:flutter/material.dart';
import 'package:frontend/providers/providers.dart';

class Meetprovider with ChangeNotifier {
  List<Meetmodel> _meetmodels = [];

  List<Meetmodel> get meetmodels => _meetmodels;

  set meetmodels(List<Meetmodel> value) {
    _meetmodels = value;
    notifyListeners();
  }

  Meetmodel? meetmodel;
  void setmeets(val) {
    meetmodel = val;
    notifyListeners();
  }
}
