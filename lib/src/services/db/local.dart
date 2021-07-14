import 'dart:async';
import 'dart:io';

import 'package:empty_flutter/src/models/sample.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '_queries.dart';
import '_source.dart';

class LocalDatabase with Queries implements LocalDao {
  late Database db;

  var readyCompleter = Completer();

  Future get ready => readyCompleter.future;

  Future init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = "${documentsDirectory.path}/sample.db";

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute(createSampleTable);
      },
    );
  }

  @override
  Future<List<Model>> getModels() async {
    await ready;
    final maps = await db.query(sampleTable, columns: null, orderBy: 'id ASC');

    if (maps.length > 0) {
      return maps.map((item) => Model.fromDb(item)).toList();
    }

    return [];
  }

  @override
  Future addModels(List<Model> models) async {
    await ready;
    Batch batch = db.batch();
    models.forEach((model) {
      batch.insert(sampleTable, model.toDb(),
          conflictAlgorithm: ConflictAlgorithm.ignore);
    });
    return batch.commit(noResult: true);
  }

  // Singleton
  static final LocalDatabase _singleton = LocalDatabase._internal();

  factory LocalDatabase() {
    return _singleton;
  }

  LocalDatabase._internal(){
    init().then((_) {
      readyCompleter.complete();
    });
  }
}
