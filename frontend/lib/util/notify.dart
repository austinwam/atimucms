import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class Notify {
  Future<void> showmessage(String message, Duration time, int kind) async {
    var cancel = BotToast.showText(
        text: message,
        duration: time,
        contentColor: kind == 0 ? Colors.green : Colors.red);
    cancel();
  }
}
