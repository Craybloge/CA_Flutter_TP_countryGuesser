import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pays_pour_un_champion/model/country.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du pays: ${country.name}'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Text("nombre d'habitants : ${country.population}"),
          Text("continent : ${country.continent}"),
        ]),
      ),
    );
  }
}
