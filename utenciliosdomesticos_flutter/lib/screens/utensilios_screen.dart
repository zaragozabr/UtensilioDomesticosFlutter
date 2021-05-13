import 'package:flutter/material.dart';
import 'package:utenciliosdomesticos_flutter/models/utensilio_model.dart';
import 'package:utenciliosdomesticos_flutter/repository/utensilio_repository.dart';

class UtensiliosScreen extends StatefulWidget {
  @override
  UtensiliosScreenState createState() => UtensiliosScreenState();
}

class UtensiliosScreenState extends State<UtensiliosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(79, 79, 79, 1.0),
        title: Text("Utensilios Domésticos:",
            style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<List<UtensilioModel>>(
        future: UtensilioRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<UtensilioModel> utensilios) {
    return ListView.builder(
      itemCount: utensilios == null ? 0 : utensilios.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardUtensilio(utensilios[index]);
      },
    );
  }

  Card cardUtensilio(UtensilioModel utensilios) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 5.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 230, 140, 1.0),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.black,
                ),
              ),
            ),
            child: Icon(
              utensilios.icon,
              color: Colors.black,
            ),
          ),
          title: Text(
            utensilios.nome,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Tamanho: ' + utensilios.tamanho,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    utensilios.preco,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
            size: 30.0,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              "/utensilios_detalhes",
              //arguments é o objeto sendo passado
              arguments: utensilios,
            );
          },
        ),
      ),
    );
  }
}
