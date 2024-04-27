class PersonagemDao {
  static const String tableSql = 'CREATE TABLE $tablename('
      '$name TEXT, '
      '$nivel INTEGER, '
      '$image TEXT)';

  static const String tablename = 'personagemTable';
  static const String name = 'name';
  static const String nivel = 'nivel';
  static const String image = 'image';
}
