import '../data/dao.dart';

class PersonagemDao {
  final String personagemTable;
  final String name;
  final String image;
  final int difficulty;

  PersonagemDao({
    required this.personagemTable,
    required this.name,
    required this.image,
    required this.difficulty,
  });

  PersonagemDao fromMap(Map<String, dynamic> map) {
    return PersonagemDao(
      personagemTable: map[tablename],
      name: map[name],
      image: map[image],
      difficulty: map[difficulty],
    );
  }
}
