import 'package:empty_flutter/src/models/sample.dart';

abstract class LocalDao {
  Future<List<Model>> getModels();
  Future addModels(List<Model> models);
}

abstract class RemoteDao {
  Future<List<Model>> getModels();
}