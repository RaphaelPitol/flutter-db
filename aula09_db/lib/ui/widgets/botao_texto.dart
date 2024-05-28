import 'package:flutter/material.dart';

class BotaoTexto extends StatelessWidget {
  final String texto;
  final VoidCallback click;
  final Color? cor;

  const BotaoTexto(
      {required this.texto, required this.click, this.cor, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: click,
        child: Text(texto, style: TextStyle(color: cor)),
    );
  }
}
