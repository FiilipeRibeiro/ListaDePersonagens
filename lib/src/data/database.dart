import 'package:lista_de_personagens/src/data/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  String path = join(await getDatabasesPath(), 'personagens.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(PersonagemDao.tableSql);
    },
    version: 1,
  );
}
