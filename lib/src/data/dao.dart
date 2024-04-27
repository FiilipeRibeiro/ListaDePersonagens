const String tablename = '_personagemTable';
const String name = '_name';
const String difficulty = 'difficulty';
const String image = 'image';

const String tableSql = '''
  CREATE TABLE $tablename ( 
    $name TEXT, 
    $difficulty INTEGER,
    $image TEXT)
  ''';

class PersonagemProvider {
  save() async {}
  
  findAll() async {
    print('Abrindo findAll');
  }

  find() async {}
  delete() async {}
}
