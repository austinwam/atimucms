import 'package:sembast/sembast.dart';

import '../data/db.dart';
import '../providers/providers.dart';

class Accountdb {
  Future<List<Accountmodel>> getaccounts() async {
    await DB().init();
    List<Accountmodel> accmodel = [];
    final Database? db = DB().database;
    var store = intMapStoreFactory.store('accountdb');
    final finder = Finder(sortOrders: [SortOrder('updateint')]);
    var pro = await store.find(db!, finder: finder);
    for (var i = 0; i < pro.length; i++) {
      var tra = Accountmodel.fromMap(pro[i].value);
      accmodel.add(tra);
    }

    await DB().close();
    return accmodel;
  }

  Future<List<Accountmodel>> filterby(kind, kindname) async {
    await DB().init();
    List<Accountmodel> accmodel = [];
    final Database? db = DB().database;

    var store = intMapStoreFactory.store('accountdb');
    var finder = Finder(
      filter: Filter.equals(kind, kindname),
    );

    var pro = await store.find(db!, finder: finder);

    for (var i = 0; i < pro.length; i++) {
      var tra = Accountmodel.fromMap(pro[i].value);
      accmodel.add(tra);
    }
    await DB().close();
    return accmodel;
  }

  Future<List<Accountmodel>> getaccount(propid) async {
    await DB().init();
    List<Accountmodel> accmodel = [];
    final Database? db = DB().database;

    var store = intMapStoreFactory.store('accountdb');
    var finder = Finder(
        filter: Filter.and([
      Filter.equals('propertyid', propid),
      Filter.equals("active", true),
    ]));

    var pro = await store.find(db!, finder: finder);

    for (var i = 0; i < pro.length; i++) {
      var tra = Accountmodel.fromMap(pro[i].value);
      accmodel.add(tra);
    }
    await DB().close();
    return accmodel;
  }

  Future<void> addproperty(Accountmodel accountmodel) async {
    await DB().init();
    final Database? db = DB().database;
    var store = intMapStoreFactory.store('accountdb');
    var finder = Finder(
      filter: Filter.equals('propertyid', accountmodel.propertyid),
    );
    var records = await store.find(db!, finder: finder);

    if (records.isEmpty) {
      DateTime updatef = DateTime.parse(accountmodel.timestamp!);
      int updateint = updatef.millisecondsSinceEpoch;
      await store.add(db, {
        "accountid": accountmodel.accountid,
        "propertyid": accountmodel.propertyid,
        "propertyname": accountmodel.propertyname,
        "useruid": accountmodel.useruid,
        "amount": accountmodel.amount,
        "amountpaid": accountmodel.amountpaid,
        "balance": accountmodel.balance,
        "rate": accountmodel.rate,
        "ratetype": accountmodel.ratetype,
        "status": accountmodel.status,
        "active": accountmodel.active,
        "agentid": accountmodel.agentid,
        "owneruid": accountmodel.owneruid,
        "updateint": updateint,
        "update": accountmodel.update,
        "timestamp": accountmodel.timestamp,
      });
    } else {
      editaccount(accountmodel);
    }
  }

  Future<void> editaccount(Accountmodel accountmodel) async {
    await DB().init();
    final Database? db = DB().database;
    var store = intMapStoreFactory.store('accountdb');
    var finder = Finder(
      filter: Filter.equals('accountid', accountmodel.accountid),
    );
    DateTime updatef = DateTime.parse(accountmodel.timestamp!);
    int updateint = updatef.millisecondsSinceEpoch;

    await store.update(
        db!,
        {
          "accountid": accountmodel.accountid,
          "propertyid": accountmodel.propertyid,
          "propertyname": accountmodel.propertyname,
          "useruid": accountmodel.useruid,
          "amount": accountmodel.amount,
          "amountpaid": accountmodel.amountpaid,
          "balance": accountmodel.balance,
          "rate": accountmodel.rate,
          "ratetype": accountmodel.ratetype,
          "status": accountmodel.status,
          "active": accountmodel.active,
          "agentid": accountmodel.agentid,
          "owneruid": accountmodel.owneruid,
          "updateint": updateint,
          "update": accountmodel.update,
          "timestamp": accountmodel.timestamp,
        },
        finder: finder);
  }

  Future<void> deleteaccount() async {
    await DB().init();
    final Database? db = DB().database;
    var store = intMapStoreFactory.store('accountdb');

    await store.delete(
      db!,
    );
  }
}
