import 'package:flutter/material.dart';
import 'package:pokemon_search/models/name_pokemon.dart';

class PokemonInfo extends StatelessWidget {
  const PokemonInfo({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  final NamePokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child:
              Image.network(pokemon.sprites.other.officialArtwork.frontDefault),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Text("#${pokemon.id}"),
                Text(
                  "${pokemon.name}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Column(
                  children: List.generate(pokemon.types.length,
                      (int index) => Text("${pokemon.types[index].type.name}")),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
