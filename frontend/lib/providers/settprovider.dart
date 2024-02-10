import 'package:flutter/material.dart';

import '../data/data.dart';

class Settingprovider with ChangeNotifier {
  bool theme = false;

  settheme(data) {
    theme = data;
    notifyListeners();
  }

  Future getdata() async {
    var themedata =
        await Sharedpref().getdata(Kind.string.text, Kindid.theme.text);
    settheme(themedata);
  }

  Future changetheme() async {
    if (theme == true) {
      Sharedpref().adddata(Kind.bool.text, Kindid.theme.text, false);
      settheme(false);
    } else {
      Sharedpref().adddata(Kind.bool.text, Kindid.theme.text, false);
      settheme(true);
    }
  }
}
