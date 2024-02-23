import 'package:flutter/material.dart';

import 'models.dart';

class Teamsprovider with ChangeNotifier {
  List<Teammodel> _teamsmodel = [];

  List<Teammodel> get teamsmodel => _teamsmodel;

  set teamsmodel(List<Teammodel> value) {
    _teamsmodel = value;
    notifyListeners();
  }
}
