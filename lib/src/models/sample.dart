import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Model {
  List<String> list;
  String id;
  String title;
  bool active;

  Model.fromJsonMap(Map<String, dynamic> map)
      : list = List<String>.from(map["list"]),
        id = map["id"],
        title = map["title"],
        active = map["active"] == true;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list'] = list;
    data['id'] = id;
    data['title'] = title;
    data['active'] = active;
    return data;
  }

  Map<String, dynamic> toDb() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list'] = jsonEncode(list);
    data['id'] = id;
    data['title'] = title;
    data['active'] = active ? 1 : 0;
    return data;
  }

  Model.fromDb(Map<String, dynamic> map)
      : list = List<String>.from(jsonDecode(map["list"])),
        id = map["id"],
        title = map["title"],
        active = map["active"] == 1;

  Model.fromSnapshot(DocumentSnapshot doc)
      : list = List<String>.from(doc["list"]),
        id = doc.id,
        title = doc["title"],
        active = doc["active"] == true;

  @override
  String toString() {
    return '(id=$id,title=$title,list=$list,active=$active)';
  }

  static String collection = "sample";
}