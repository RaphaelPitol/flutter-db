import 'package:aula09_db/extensions/string_extension.dart';

class Editora {
  int? codigo;
  String nome;

  Editora({this.codigo,  required this.nome});

  //metodo para transformar os dados vindos do banco
  factory Editora.fromMap(Map mapa){
    return Editora(
      codigo: mapa['codigo'].toString().toInt(),
      nome: mapa['nome']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'nome': nome
    };
  }
}