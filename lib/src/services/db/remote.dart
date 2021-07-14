import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empty_flutter/src/models/sample.dart';

import '_source.dart';

class RemoteDatabase implements RemoteDao {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  @override
  Future<List<Model>> getModels() async {
    try {
      var result = await _instance
          .collection(Model.collection)
          .where("active", isEqualTo: true)
          .get();

      return result.docs.map((e) => Model.fromSnapshot(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // Singleton
  static final RemoteDatabase _singleton = RemoteDatabase._internal();

  factory RemoteDatabase() {
    return _singleton;
  }

  RemoteDatabase._internal(){
    String host = Platform.isAndroid ? '10.0.2.2:8080' : 'localhost:8080';

    _instance.settings = Settings(
      host: host,
      sslEnabled: false,
      persistenceEnabled: false,
    );
  }
}
