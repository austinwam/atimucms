import 'dart:convert';

import 'package:frontend/data/sharedata.dart';
import 'package:frontend/util/util.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Apirequest {
  Future<void> postdata(url, data) async {
    var token = Sharedpref().getdata(Kind.string.text, Data.token.text);
    var eurl = Uri.parse(url);
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bear $token"
    };
    var response = await http.post(eurl, body: data, headers: headers);
  }

  Future<void> putwithtoken(url, data) async {
    var token = Sharedpref().getdata(Kind.string.text, Data.token.text);
    var eurl = Uri.parse(url);
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bear $token"
    };
    var response = await http.post(eurl, body: data, headers: headers);
  }

  Future<void> refresh(datatype) async {
    var token = Sharedpref().getdata(Kind.string.text, Data.token.text);
    var timestamp = Sharedpref().gettime(datatype);
    var serverurl = "http://127.0.0.1:8000/refresh";
    var url = Uri.https(serverurl);
    var data = {"data": "$datatype", "timestamp": "$timestamp"};
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bear $token"
    };
    var response = await http.post(url, body: data, headers: headers);
    await manageresp(response);
  }

  Future<void> manageresp(Response response) async {
    if (response.statusCode <= 250) {
      var jresp = json.decode(response.body);
      var message = jresp["message"];
      var data = jresp["data"];
      Notify().showmessage(message, const Duration(seconds: 3), 1);
      return data;
    } else if (response.statusCode >= 400) {
      var jresp = json.decode(response.body);
      var message = jresp["message"];
      Notify().showmessage(message, const Duration(seconds: 3), 1);
    } else {
      var message = "an error occorred";
      Notify().showmessage(message, const Duration(seconds: 3), 1);
    }
  }

  Future<void> addafile() async {}
}
