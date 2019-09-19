import 'package:bill/Inquilino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class AddInquilino extends StatefulWidget {
  @override
  _AddInquilinoState createState() => _AddInquilinoState();
}

class _AddInquilinoState extends State<AddInquilino> {

  TextEditingController NomeControle= TextEditingController();
  TextEditingController dataControle= TextEditingController();
  TextEditingController numeroControle= TextEditingController();

  GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(16),),
                  Container(
                    child: Icon(Icons.person_add, size: 50, color: Colors.red,),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Text("Adicionar Inquilino", style: TextStyle(fontSize: 20)),
                  Padding(padding: EdgeInsets.all(14)),
                  TextFormField(//Nome
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nome",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    controller: NomeControle,
                    validator: (value){
                      if(value.isEmpty)
                        return "O novo inquilino precisa de um nome!";
                      },
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  TextFormField(//Data
                    maxLength: 02,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Dia de pagamento",
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
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Número de telefone",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    controller: numeroControle,
                    validator: (value){
                      if(value.isEmpty)
                        return "É preciso registrar um telefone";
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
          if(_formKey.currentState.validate()){
            inquilinos.add(Inquilino(NomeControle.text, int.parse(dataControle.text), int.parse(numeroControle.text)));
            Navigator.of(context).pop();
          }
        },
        child: Icon(Icons.done),),
    );
  }
}
