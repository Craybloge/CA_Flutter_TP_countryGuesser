import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Country {
  final String name;
  final String capital;
  // final String currency;
  final String continent;
  final int population;
  final String flag;
  final String image;

  Country(this.name, this.capital, this.continent, this.population, this.image,
      this.flag);

  factory Country.fromJson(Map<String, dynamic> json) {
    final String name = json['translations']['fra']['common'];
     String capital = "";
    try {
      capital = json['capital'][0];
    } on NoSuchMethodError {
      capital = "n'existe pas";
    }
    //  final String currency = json['currencies'][json['currencies'].keys[0]]['name'];
    final String continent = json['continents'][0];
    final int population = json['population'];
    final String flag = json['flags']['svg'];
    final String image =
        "https://raw.githubusercontent.com/djaiss/mapsicon/master/all/${json['cca2'].toLowerCase()}/vector.svg";

    return Country(name, capital, continent, population, flag, image);
  }
}
