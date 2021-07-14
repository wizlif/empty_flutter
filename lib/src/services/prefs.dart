import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Prefs{

  late SharedPreferences _prefs;

  var readyCompleter = Completer();

  Future get ready => readyCompleter.future;


  Prefs() {
    _init().then((_) {
      readyCompleter.complete();
    });
  }

  static const String _LOCAL_PREF_KEY = "_LOCAL_PREF_KEY";

  Future _init()async{
    _prefs = await SharedPreferences.getInstance();
  }

  Future<int> getPref()async {
    await ready;
    return _prefs.getInt(_LOCAL_PREF_KEY) ?? 0;
  }

  Future<bool> setPref(int pref) async{
    await ready;
    return await _prefs.setInt(_LOCAL_PREF_KEY,pref);
  }

}