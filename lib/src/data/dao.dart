import 'package:lista_de_personagens/src/data/convert.dart';
import 'package:lista_de_personagens/src/data/database.dart';
import 'package:lista_de_personagens/src/data/model.dart';
import 'package:sqflite/sqflite.dart';

import '../widgets/personagens.dart';

class PersonagemProvider {
  save(Personagens personagem) async {
    final Database db = await getDatabase();
    var itemExists = await find(personagem.name);
    Map<String, dynamic> personagemMap = PersonagemConvert.toMap(personagem);
    if (itemExists.isEmpty) {
      return await db.insert(
        PersonagemDao.tablename,
        personagemMap,
      );
    } else {
      return await db.update(
        PersonagemDao.tablename,
        personagemMap,
        where: ' ${PersonagemDao.name} = ?',
        whereArgs: [personagem.name],
      );
    }
  }

  Future<List<Personagens>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(PersonagemDao.tablename);
    print('FindAll: $result');
    return PersonagemConvert.toList(result);
  }

  Future<List<Personagens>> find(String nomeDoPersonagem) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      PersonagemDao.name,
      where: '${PersonagemDao.name} = ?',
      whereArgs: [nomeDoPersonagem],
    );
    print('Find: $result');
    return PersonagemConvert.toList(result);
  }

  delete(String nomeDoPersonagem) async {
    final Database db = await getDatabase();
    return db.delete(PersonagemDao.tablename, where: '${PersonagemDao.name} = ?', whereArgs: [nomeDoPersonagem]);
  }
}
