import 'package:flutter/cupertino.dart';
import 'package:bill/Caixa.dart';

class Inquilino{

  String nome;
  var entrada;
  int numero;
  ExactAssetImage foto;

  List<Caixa>caixas;
  Map<Caixa, double> percentage;

  Inquilino(this.nome, this.entrada, numero){
   caixas= new List<Caixa>();
  }

  void addCaixa(Caixa box, double porcentagem){
    caixas.add(box);
    percentage[box]=porcentagem;
  }

}