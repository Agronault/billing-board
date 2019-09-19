import 'package:bill/AddCaixa.dart';
import 'package:bill/CaixaPannel.dart';
import 'package:flutter/material.dart';

import 'package:bill/InquilinoCard.dart';
import 'package:bill/Inquilino.dart';
import 'package:bill/AddInquilino.dart';
import 'package:bill/Caixa.dart';

List<Inquilino> inquilinos;
List<Caixa> caixas;

void main() {
  inquilinos= new List<Inquilino>();
  caixas=new List<Caixa>();
  //inquilinos.add(Inquilino("alexandre", <int>[06, 03, 2018]));
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        "/add": (BuildContext context)=> AddInquilino(),
        "/addBox": (BuildContext context)=> AddCaixa()
      },
      debugShowCheckedModeBanner: false,
      title: 'BillBoard',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  void _addInquilino() {
      Navigator.of(context).pushNamed("/add");
  }

  void pushCaixas(){
    showModalBottomSheet(context: context,
        builder:(context){
        return CaixaPannel();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled){
            return <Widget>[
              SliverAppBar(
                expandedHeight: 250,
                floating: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Icon(Icons.highlight, size: 100, color: Colors.white,),
                  centerTitle: true,
                  title: Text("Gerenciar Contas", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),
                ),
              ),
            ];
          },
          body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(),
                  Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.assignment, size: 30,),
                              onPressed: pushCaixas),
                          Text("Caixas", style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(15, 0, 0, 0))
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(8),),
              Column(
                children: _getCards(inquilinos),
              ),
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addInquilino,
        tooltip: 'Adicionar novo Inquilino',
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> _getCards(List<Inquilino> aux){
    List<Widget> outAux= new List<Widget>();
    
    outAux.add(Padding(padding: EdgeInsets.all(10),));
    for( var inq in aux){
      outAux.add(InquilinoCard(inq));
      outAux.add(Padding(padding: EdgeInsets.all(10),));
    }
    if(aux.length==0){
      outAux.add(
          Center( child: Column(
            children: <Widget>[ 
              Icon(Icons.group),
              Padding(padding: EdgeInsets.all(5)),
              Text("Lista vazia, comece registrando seus inquilinos!"),
            ],
          ),
        )
      );
      
    }
    
  return outAux;
  }

}

