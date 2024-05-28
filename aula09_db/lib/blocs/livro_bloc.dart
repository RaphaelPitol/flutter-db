
import 'package:aula09_db/datasources/local/livro_helper.dart';
import 'package:aula09_db/models/livro.dart';

class LivroBloc {
  final _livroHerper = LivroHelper();


  Future<List<Livro>> getByEditora(int codigoEditora) {
    return _livroHerper.getByEditora(codigoEditora);
  }
}