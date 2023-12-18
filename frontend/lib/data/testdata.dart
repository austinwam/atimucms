import 'dart:convert';
import 'package:flutter/services.dart';




Future<void> readJson(kind) async {
  final String response = await rootBundle.loadString('assets/$kind.json');
  final data = await json.decode(response);
  print(data);
}
