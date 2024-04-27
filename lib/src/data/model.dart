class PersonagemDao {
  static String tablename = '_personagemTable';
  static String name = '_name';
  static String nivel = 'nivel';
  static String image = 'image';

  static String tableSql = '''
  CREATE TABLE $tablename ( 
    $name TEXT, 
    $nivel INTEGER,
    $image TEXT)
  ''';
}
