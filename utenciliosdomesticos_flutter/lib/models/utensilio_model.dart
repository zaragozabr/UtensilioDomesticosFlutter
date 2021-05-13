import 'package:flutter/cupertino.dart';

class UtensilioModel {
  int id;
  String nome;
  String tamanho;
  String preco;
  String descricao;
  IconData icon;
  AssetImage imagem;

  UtensilioModel({
    this.descricao,
    this.id,
    this.nome,
    this.preco,
    this.tamanho,
    this.icon,
    this.imagem,
  });
}
