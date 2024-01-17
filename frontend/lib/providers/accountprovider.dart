import 'package:flutter/material.dart';
import 'package:frontend/data/api.dart';
import 'package:frontend/data/sharedata.dart';
import 'package:frontend/db/db.dart';
import 'package:frontend/providers/models.dart';

class Accountprovider with ChangeNotifier {
  List<Accountmodel> _accountsmodel = [];

  List<Accountmodel> get accountsmodel => _accountsmodel;
  set accountsmodel(List<Accountmodel> value) {
    _accountsmodel = value;
    notifyListeners();
  }

  Future<void> getaccounts(refresh) async {
    if (refresh == true) {
      Apirequest().refresh(Datatype.accounts.text);
      await mapdata();
    }
    await mapdata();
  }

  Future<void> addaccounts() async {}
  Future<void> editaccounts() async {}

  Future<void> mapdata() async {
    List<Accountmodel> accountlist = await Accountdb().getaccounts();
    if (accountlist.isNotEmpty) {
      accountsmodel = accountlist;
    } else {
      accountsmodel = [];
    }
  }
}
