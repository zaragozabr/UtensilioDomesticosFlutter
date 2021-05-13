import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utenciliosdomesticos_flutter/models/utensilio_model.dart';
import 'package:utenciliosdomesticos_flutter/repository/database.dart';

class UtensilioRepository {
  Future<List<UtensilioModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<UtensilioModel> utensilios = new List<UtensilioModel>();

    if (db.created) {
      utensilios = new List<UtensilioModel>();
      utensilios.add(new UtensilioModel(
          id: 1,
          nome: 'Geladeira',
          preco: 'Preço: R\$ 2000',
          tamanho: 'Grande',
          descricao:
              'Não está conseguindo organizar os alimentos em sua geladeira por falta de espaço? Então é hora de trocá-la pelo Refrigerador Consul CRM43NK. Com 386 litros, o eletrodoméstico possui espaço de sobra e diversas prateleiras para organizar seus mantimentos. E tem mais: é Frost Free!',
          icon: Icons.kitchen_sharp,
          imagem: AssetImage('cozinha.jpg')));
      utensilios.add(new UtensilioModel(
        id: 2,
        nome: 'Microondas',
        preco: 'Preço: R\$ 500',
        tamanho: 'Pequeno',
        descricao:
            'O Micro-ondas PMO21E 21 Litros Philco é o que você precisava para deixar sua cozinha mais prática e ganhar tempo no preparo das suas refeições. Com capacidade de 21litros, este produto possui teclas fáceis para que você possa cozinhar e, até mesmo, descongelar.',
        icon: Icons.fireplace,
        imagem: AssetImage('micro.jpg'),
      ));
      utensilios.add(new UtensilioModel(
        id: 3,
        nome: 'Fogão 4 Bocas',
        preco: 'Preço: R\$ 1000',
        tamanho: 'Médio',
        descricao:
            'O fogão Brastemp 4 Bocas Piso tem um design moderno e sofisticado com o vidro panorâmico, que possibilita maior amplitude para visualização e acompanhamento do prato durante o preparo. Ele conta também com prateleiras deslizante e botões removíveis.',
        icon: Icons.local_dining,
        imagem: AssetImage('fogao.jpg'),
      ));
      utensilios.add(new UtensilioModel(
        id: 4,
        nome: 'Air Frier Black',
        preco: 'Preço: R\$ 1200',
        tamanho: 'Pequeno',
        descricao:
            'Conheça a Fritadeira Elétrica Airfryer Black Edition PHILIPS WALITA! A mais rápida e versátil agora em uma versão ainda mais EXCLUSIVA para fazer a diferença na sua cozinha ou no seu espaço gourmet!',
        icon: Icons.outdoor_grill,
        imagem: AssetImage('airfrier.jpg'),
      ));
    }
    return new Future.value(utensilios);
  }
}
