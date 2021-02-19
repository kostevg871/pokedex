import 'package:flutter/material.dart';
import 'package:pokemon_search/screen/random_pokemon.dart';
import 'package:pokemon_search/screen/search_pokemon.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffe0a604),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SearchPokemon();
                    }));
                  },
                  color: Colors.white,
                  child: Text("Search Pokemon"),
                ),
              ),
              Container(
                width: 200,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RandomPokemonScreen();
                    }));
                  },
                  color: Colors.white,
                  child: Text("Random Pokemon"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
