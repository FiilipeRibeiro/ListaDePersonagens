import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dao.dart';

Future<Database> getDatabase() async {
  String path = join(await getDatabasesPath(), 'personagens.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(tableSql);
    },
    version: 1,
  );
}
