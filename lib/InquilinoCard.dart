import 'package:flutter/material.dart';
import 'package:bill/Inquilino.dart';

class InquilinoCard extends StatefulWidget {
  const InquilinoCard(this.inquilino);

  final Inquilino inquilino;

  @override
  _InquilinoCardState createState() => _InquilinoCardState();
}

class _InquilinoCardState extends State<InquilinoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.inquilino.nome, style: TextStyle(fontSize: 20),),
                Padding(padding: EdgeInsets.all(5),),
                Text("Data de vencimento: "+widget.inquilino.entrada.toString()),
                Text("Caixas Vinculadas: "+widget.inquilino.caixas.length.toString()),
              ],
            ),
          ),
          Container(
          ),
          Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.add), onPressed: _add),
              IconButton(icon: Icon(Icons.edit), onPressed: _edit),
            ],
          ),
        ],
      ),
    );
  }

  void _add(){

  }

  void _edit(){

  }

}
