import 'package:sqflite/sqlite_api.dart';

import '../data/database.dart';
import '../pages/home/widgets/personagens.dart';

class PersonagemDao {
  static const String tableSql = 'CREATE TABLE $tablename('
      '$name TEXT, '
      '$nivel INTEGER, '
      '$image TEXT)';

  static const String tablename = 'personagemTable';
  static const String name = 'name';
  static const String nivel = 'nivel';
  static const String image = 'image';

  save(Personagens personagem) async {
    final Database db = await getDatabase();
    var itemExists = await find(personagem.name);
    Map<String, dynamic> personagemMap = toMap(personagem);

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
    return toList(result);
  }

  Future<List<Personagens>> find(String nomeDoPersonagem) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      PersonagemDao.tablename,
      where: '${PersonagemDao.name} = ?',
      whereArgs: [nomeDoPersonagem],
    );

    return toList(result);
  }

  delete(String nomeDoPersonagem) async {
    final Database db = await getDatabase();
    return db.delete(PersonagemDao.tablename,
        where: '${PersonagemDao.name} = ?', whereArgs: [nomeDoPersonagem]);
  }

  static List<Personagens> toList(
      List<Map<String, dynamic>> listaDePersonagens) {
    final List<Personagens> personagens = [];
    for (Map<String, dynamic> linha in listaDePersonagens) {
      final Personagens personagem = Personagens(
        name: linha[PersonagemDao.name],
        image: linha[PersonagemDao.image],
        nivel: linha[PersonagemDao.nivel],
      );
      personagens.add(personagem);
    }
    return personagens;
  }

  static Map<String, dynamic> toMap(Personagens personagem) {
    final Map<String, dynamic> mapaDePersonagens = {};
    mapaDePersonagens[PersonagemDao.name] = personagem.name;
    mapaDePersonagens[PersonagemDao.image] = personagem.image;
    mapaDePersonagens[PersonagemDao.nivel] = personagem.nivel;
    return mapaDePersonagens;
  }
}
