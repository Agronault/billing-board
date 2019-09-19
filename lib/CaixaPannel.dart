import 'package:flutter/material.dart';

import 'main.dart';

class CaixaPannel extends StatefulWidget {
  @override
  _CaixaPannelState createState() => _CaixaPannelState();
}

class _CaixaPannelState extends State<CaixaPannel> {
  @override
  Widget build(BuildContext context) {
    List<Widget>aux= new List<Widget>();

    if(caixas.length>0){
      for(var box in caixas){
        aux.add(Row(
          children: <Widget>[
            Row(children: <Widget>[
              Column(
                children: <Widget>[
                  Text(box.nome),
                  Text("Valor: "+box.preco.toString()),
                  Text("Vencimento: "+box.data.toString()),

                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              )
            ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,),
            Container(),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        )
        );
      }
    }else
      aux.add(Text("Sem caixas registradas"));

    aux.add(IconButton(icon: Icon(Icons.add),
        onPressed: (){
        Navigator.of(context).pushNamed("/addBox");
    }
    ));
    return Column(
      children: aux,
    );
  }
}
