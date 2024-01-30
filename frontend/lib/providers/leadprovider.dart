import 'package:flutter/material.dart';

import 'models.dart';

class Leadprovider with ChangeNotifier {
  List statuss = ["new", "contracted", "checkup"];
  String? status;
  bool? isload;
  List<Leadmodels> _leadmodels = [];

  List<Leadmodels> get leadmodels => _leadmodels;

  set leadmodels(List<Leadmodels> value) {
    _leadmodels = value;
    notifyListeners();
  }

  Leadmodels? leadmodel;

  void setload(val) {
    isload = val;
    notifyListeners();
  }

  void setstatus(val) {
    status = val;
    notifyListeners();
  }
}
