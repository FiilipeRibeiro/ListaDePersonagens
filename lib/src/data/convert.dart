import '../widgets/personagens.dart';
import 'model.dart';

class PersonagemConvert {
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
