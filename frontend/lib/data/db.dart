// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';
import 'dart:async';

class DB {
  static final DB _db = DB._internal();
  factory DB() => _db;
  DB._internal();

  Database? _database;
  Database? get database => _database;

  Future<void> init() async {
    const String dbName = 'rustcrm.db';
    var isWeb = kIsWeb;
    if (isWeb == true) {
      var factory = databaseFactoryWeb;
      _database = await factory.openDatabase(dbName);
    } else {
      final String dir = (await getApplicationDocumentsDirectory()).path;
      final String dbPath = path.join(dir, dbName);

      _database = await databaseFactoryIo.openDatabase(dbPath);
    }

    // var store = intMapStoreFactory.store();
    // var factory = databaseFactoryWeb;
  }

  Future<void> close() async {
    await _database!.close();
  }
}
