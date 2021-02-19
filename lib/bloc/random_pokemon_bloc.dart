import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_search/models/name_pokemon.dart';
import 'package:pokemon_search/repository/repository.dart';

part 'random_pokemon_event.dart';
part 'random_pokemon_state.dart';

class RandomPokemonBloc extends Bloc<RandomEvent, RandomState> {
  final PokemonApiClient pokemonApiClient;

  RandomPokemonBloc({@required this.pokemonApiClient})
      : assert(pokemonApiClient != null),
        super(RandomInitial());

  @override
  Stream<RandomState> mapEventToState(
    RandomEvent event,
  ) async* {
    if (event is PokemonRequestedRandom) {
      yield RandomLoadInProgress();
      try {
        final NamePokemon pokemon =
            await pokemonApiClient.getPokemonRandom(event.id);
        yield RandomLoadSuccess(pokemon: pokemon);
      } catch (_) {
        yield RandomLoadFailure();
      }
    }
  }
}
