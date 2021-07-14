class Queries {
  String get sampleTable => "sample_data";

  String idColumn = "id";

  String get createSampleTable => '''
        CREATE TABLE IF NOT EXISTS $sampleTable (
          $idColumn TEXT PRIMARY KEY,
          title TEXT,
          list TEXT,
          active INTEGER
        )
        ''';
}
