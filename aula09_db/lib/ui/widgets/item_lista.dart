import 'package:flutter/material.dart';

class ItemLista extends StatelessWidget {
  final String titulo;
  final VoidCallback? click;
  final VoidCallback? clickLong;


  const ItemLista({required this.titulo,this.click, this.clickLong, super.key});

  @override
  Widget build(BuildContext context) {
    //identifica gestos de click arrastar precionar
    return GestureDetector(
      onTap: click,
      onLongPress: clickLong,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Text(titulo),
        ),
      ),
    );
  }
}
