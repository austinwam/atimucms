import 'package:flutter/material.dart';
import 'package:frontend/providers/models.dart';

class Userprovider with ChangeNotifier {
  List<Usermodel> _usersmodel = [];

  List<Usermodel> get usersmodel => _usersmodel;
  set usersmodel(List<Usermodel> value) {
    _usersmodel = value;
    notifyListeners();
  }
}
