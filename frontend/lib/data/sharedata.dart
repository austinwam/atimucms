import 'package:shared_preferences/shared_preferences.dart';

enum Datatype {
  users("users"),
  accounts("accounts"),
  meets("meets");

  const Datatype(this.text);
  final String text;
}

enum Kindid {
  token("token"),
  userid("userid"),
  theme("theme"),
  isfirsttime("isfirsttime");

  const Kindid(this.text);
  final String text;
}

enum Kind {
  string("string"),
  bool("bool"),
  int("int");

  const Kind(this.text);
  final String text;
}

class Sharedpref {
  Future<void> adddata(kind, String kindid, data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (kind == "string") {
      prefs.setString(kindid, data);
    } else if (kind == "int") {
      prefs.setInt(kindid, data);
    } else if (kind == "bool") {
      prefs.setBool(kindid, data);
    }
  }

  Future<dynamic> getdata(String kind, data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (kind == "string") {
      String? rdata = prefs.getString(data);
      return rdata;
    } else if (kind == "int") {
      int? rdata = prefs.getInt(data);
      return rdata;
    } else if (kind == "bool") {
      bool? rdata = prefs.getBool(data);
      return rdata;
    }
  }

  Future<String?> gettime(String typetime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? time = prefs.getString(typetime);
    String dt = "2010-01-01 09:55:22.88";

    if (time == null) {
      return dt;
    } else {
      return dt;
    }
  }

  Future<void> addtime(typetime, timestamp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(typetime, timestamp);
  }
}
