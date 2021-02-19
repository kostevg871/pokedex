import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_search/bloc/pokemon_bloc.dart';
import 'package:pokemon_search/widget/home_page_widget/pokemon_info.dart';

class ImagePokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<PokemonBloc, PokemonState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is PokemonInitial) {
            return Center(child: Text("Please input Pokemon"));
          }
          if (state is PokemonLoadInProgress) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PokemonLoadSuccess) {
            final pokemon = state.pokemon;
            return PokemonInfo(pokemon: pokemon);
          }
          if (state is PokemonLoadFailure) {
            return Center(child: Text("not found pokemon"));
          }
        },
      ),
    );
  }
}
