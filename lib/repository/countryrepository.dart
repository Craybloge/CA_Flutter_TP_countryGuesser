import 'dart:convert';

import 'package:http/http.dart';
import 'package:pays_pour_un_champion/model/country.dart';



class CountryRepository {
  Future<List<Country>> fetchCountries(String query) async {
    final Response response = await get(
        Uri.parse('https://restcountries.com/v3.1/all'));
    if (response.statusCode == 200) {
      final List<Country> countries = [];
      final List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
        json.forEach((country) {
          countries.add(Country.fromJson(country));
          print("ajout d'un pays");
        });
      
      return countries;
    } else {
      throw Exception('Failed to load addresses');
    }
  }
  
}
