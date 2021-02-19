import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_search/bloc/random_pokemon_bloc.dart';
import 'package:pokemon_search/widget/home_page_widget/pokemon_info.dart';

class RandomPokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        child: BlocBuilder<RandomPokemonBloc, RandomState>(
          // ignore: missing_return
          builder: (context, state) {
            if (state is RandomInitial) {
              return Center(child: Text("Please press random button"));
            }
            if (state is RandomLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is RandomLoadSuccess) {
              final pokemon = state.pokemon;
              return PokemonInfo(pokemon: pokemon);
            }
            if (state is RandomLoadFailure) {
              return Center(child: Text("not found pokemon"));
            }
          },
        ),
      ),
    );
  }
}
