import 'package:flutter/material.dart';

class Transactionprovider with ChangeNotifier {
  List statuss = ["all", "paid", "request", "failed"];
  String status = "all";

  void setstatus(val) {
    status = val;
    notifyListeners();
  }
}
