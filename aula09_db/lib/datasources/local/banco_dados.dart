import 'package:aula09_db/datasources/local/editora_helper.dart';
import 'package:aula09_db/datasources/local/livro_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDados {
  //Singleton pesquisar sobre!!!!
  BancoDados._internal();
  static final BancoDados _instance = BancoDados._internal();
  factory BancoDados() => _instance;

  //Database é do sqlite aki com ? esta dizendo que pode ser nulo
  Database? _db;

  Future<Database> get db async {
    final path = await getDatabasesPath();
    final caminhoBanco = join(path, "meus_livros.db");
    //openDatabase abre o arquivo se existir se não ele cria o banco
    _db = await openDatabase(caminhoBanco, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(EditoraHelper.createSql);
          await db.execute(LivroHelper.createSql);
        });

    return _db!;
  }

  void close() {

    _db?.close();
  }

}