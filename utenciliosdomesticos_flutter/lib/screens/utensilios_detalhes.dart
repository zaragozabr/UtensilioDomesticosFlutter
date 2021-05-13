import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:utenciliosdomesticos_flutter/models/utensilio_model.dart';

class UtensiliosDetalhesScreen extends StatelessWidget {
  UtensilioModel utensilioModel;

  @override
  Widget build(BuildContext context) {
    //recebendo o objeto da pagina "pai"
    utensilioModel = ModalRoute.of(context).settings.arguments;

    final utensilioPrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: new Text(
          "R\$ " + utensilioModel.preco,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0),
        Icon(
          utensilioModel.icon,
          color: Colors.black,
          size: 48,
        ),
        Container(
          width: 150.0,
          child: new Divider(color: Colors.black),
        ),
        SizedBox(height: 10.0),
        Text(
          utensilioModel.nome,
          style: TextStyle(
            color: Colors.black,
            fontSize: 45.0,
          ),
        ),
        SizedBox(height: 22.7),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Tamanho do Utensilio: ' + utensilioModel.tamanho,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: utensilioPrice,
            ),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              //imagem de fundo dos utensilios
              image: utensilioModel.imagem,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          //cor com transparencia por cima da imagem do utensilio
          decoration: BoxDecoration(color: Color.fromRGBO(240, 230, 140, .8)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      utensilioModel.descricao,
      style: TextStyle(fontSize: 18.0),
      textAlign: TextAlign.justify,
    );

    final readButton = Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: ElevatedButton(
          onPressed: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: new Text(utensilioModel.nome + " comprado!"),
                  content: new Text(
                      "Obrigado pela preferência em comprar conosco! - ${utensilioModel.preco}"),
                  actions: <Widget>[
                    new ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(240, 230, 140, 1.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0))),
                      child: new Text(
                        "Retornar",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            ),
          },
          style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(240, 230, 140, 1.0),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40.0))),
          child: Text(
            "Clique aqui e compre com a gente!",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

    final buttonReturn = Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(240, 230, 140, 1.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0))),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Retornar para lista de Utensilios.",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
            readButton,
            buttonReturn,
          ],
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            topContent,
            bottomContent,
          ],
        ),
      ),
    );
  }
}
