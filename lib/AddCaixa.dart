import 'package:flutter/material.dart';

import 'main.dart';
import 'package:bill/Caixa.dart';

class AddCaixa extends StatefulWidget {
  @override
  _AddCaixaState createState() => _AddCaixaState();
}

class _AddCaixaState extends State<AddCaixa> {

  TextEditingController NomeControle= TextEditingController();
  TextEditingController dataControle= TextEditingController();
  TextEditingController valorControle= TextEditingController();

  GlobalKey<FormState> _boxChave= GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Form(
              key: _boxChave,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(16),),
                  Container(
                    child: Icon(Icons.assignment, size: 50, color: Colors.red,),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Text("Adicionar Nova Caixa", style: TextStyle(fontSize: 20)),
                  Padding(padding: EdgeInsets.all(14)),
                  TextFormField(//Nome
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nome da caixa",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    controller: NomeControle,
                    validator: (value){
                      if(value.isEmpty)
                        return "A caixa precisa de um nome!";
                    },
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  TextFormField(//Data
                    maxLength: 02,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Dia de vencimento",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    controller: dataControle,
                    validator: (value){
                      if(value.isEmpty)
                        return "É preciso selecionar o dia de pagamento";
                    },
                  ),
                  Padding(padding: EdgeInsets.all(9)),
                  TextFormField(//Telefone
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Valor",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    controller: valorControle,
                    validator: (value){
                      if(value.isEmpty)
                        return "Forneça o valor cobrado";
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_boxChave.currentState.validate()){
            caixas.add(new Caixa(NomeControle.text, int.parse(dataControle.text), int.parse(valorControle.text), false));
            Navigator.of(context).pop();
          }
        },
        child: Icon(Icons.done),),
    );
  }
}
