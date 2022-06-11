import 'package:flutter/material.dart';
import 'package:pays_pour_un_champion/model/country.dart';
import 'package:pays_pour_un_champion/repository/countryrepository.dart';

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
            Text(_countries.isEmpty ? "" : _countries[0].name),
            Expanded(
                child: ListView.builder(
              itemCount: _countries.length,
              itemBuilder: (context, index) => Card(
                elevation: 6,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(_countries[index].name +
                      ", " +
                      _countries[index].capital),
                  subtitle: Text(_countries[index].image),
                  onTap: () {},
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
