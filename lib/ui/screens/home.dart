import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pays_pour_un_champion/model/country.dart';
import 'package:pays_pour_un_champion/repository/countryrepository.dart';
import 'package:pays_pour_un_champion/ui/screens/details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //  List<Company> _companies = [];

  CountryRepository getcountries = CountryRepository();
  List<Country> _countries = [];
  @override
  void initState() {
    getcountries.fetchCountries("peru").then((value) {
      setState(() {
        _countries = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess the country'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Liste des pays: "),
            Expanded(
                child: ListView.builder(
              itemCount: _countries.length,
              itemBuilder: (context, index) => Card(
                elevation: 6,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(_countries[index].name +
                      ", capitale: " +
                      _countries[index].capital),
                  subtitle: SvgPicture.network(
                    _countries[index].image,
                    semanticsLabel: 'Country Image',
                    width: 200,
                    placeholderBuilder: (BuildContext context) => Container(
                        padding: const EdgeInsets.all(30.0),
                        child: const CircularProgressIndicator()),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Details(country: _countries[index])),
                    );
                  },
                ),
              ),
            ))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
