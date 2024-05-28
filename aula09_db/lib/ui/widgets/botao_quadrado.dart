import 'package:flutter/material.dart';

class BotaoQuadrado extends StatelessWidget {
  final String texto;
  final VoidCallback click;
  final IconData? icone;
  final Color? cor;

  const BotaoQuadrado({required this.click,this.texto = '',
    this.icone,this.cor,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 95,
      child: ElevatedButton(
          onPressed: click,
          style: ElevatedButton.styleFrom(backgroundColor: cor),
          child: icone != null ? Icon(icone) : Text(texto)),
    );
  }
}
