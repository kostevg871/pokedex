import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_search/models/name_pokemon.dart';

class PokemonApiClient {
  static const baseUrl = 'https://pokeapi.co/api/v2/pokemon/';
  final http.Client httpClient;

  PokemonApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<NamePokemon> getPokemonName(String name) async {
    final namePokemon = name.toLowerCase();
    final apiUrl = '${PokemonApiClient.baseUrl}$namePokemon';
    final pokemonResponse = await this.httpClient.get(apiUrl);
    if (pokemonResponse.statusCode != 200) {
      throw Exception('not found pokemon');
    }
    final pokemonJson = jsonDecode(pokemonResponse.body);
    return NamePokemon.fromJson(pokemonJson);
  }

  Future<NamePokemon> getPokemonRandom(int id) async {
    final idPokemon = id;
    final apiUrl = '${PokemonApiClient.baseUrl}$idPokemon';
    final pokemonResponse = await this.httpClient.get(apiUrl);
    if (pokemonResponse.statusCode != 200) {
      throw Exception('not found pokemon');
    }
    final pokemonJson = jsonDecode(pokemonResponse.body);
    return NamePokemon.fromJson(pokemonJson);
  }
}
