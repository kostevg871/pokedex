import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_search/bloc/random_pokemon_bloc.dart';
import 'package:pokemon_search/widget/home_page_widget/pokemon_random_info.dart';

class RandomPokemonScreen extends StatefulWidget {
  @override
  _RandomPokemonScreenState createState() => _RandomPokemonScreenState();
}

class _RandomPokemonScreenState extends State<RandomPokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Pokemon"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              final int numberPokemon = Random().nextInt(897) + 1;
              if (numberPokemon != null) {
                BlocProvider.of<RandomPokemonBloc>(context)
                    .add(PokemonRequestedRandom(id: numberPokemon));
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RandomPokemon(),
            ],
          ),
        ],
      ),
    );
  }
}
