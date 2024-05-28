import 'package:aula09_db/datasources/local/editora_helper.dart';
import 'package:aula09_db/models/editora.dart';
import 'package:aula09_db/ui/widgets/botao_texto.dart';
import 'package:aula09_db/ui/widgets/mensagem_alerta.dart';
import 'package:aula09_db/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class EditoraBloc {
  final BuildContext context;
  final Editora? editora;
  final _editoraHelper = EditoraHelper();
  final nomeController = TextEditingController();

  EditoraBloc(this.context, {this.editora}) {
    nomeController.text = editora?.nome ?? '';
  }

  Future<List<Editora>> getTodos() {
    return _editoraHelper.getTodos();
  }

  void salvar() async {
    if (nomeController.text
        .trim()
        .isEmpty) {
      MensagemAlerta().show(
          context: context,
          titulo: "Atenção",
          texto: "O Nome da Editora é Obrigatorio");
      return;
    }
    if (editora == null) {
      await _editoraHelper.inserir(Editora(nome: nomeController.text));
    }
    else {
      editora!.nome = nomeController.text;
      await _editoraHelper.alterar(editora!);
    }
    Navigator.pop(context);
  }

  void excluir() {
    MensagemPopup().show(
        context: context,
        titulo: 'Atenção',
        texto: 'Deseja realmente excluir?',
        botoes: [
          BotaoTexto(texto: 'Sim', click: _confirmarExcluir, cor: Colors.red),
          BotaoTexto(texto: 'Não', click: (){ Navigator.pop(context);}),
        ]
    );
  }

  void _confirmarExcluir(){
    if(editora != null){
      _editoraHelper.excluir(editora!.codigo ?? 0);
    }
    Navigator.pop(context);//Fecha mensagem de alerta
    Navigator.pop(context);//Fecha a tela de
  }
}
