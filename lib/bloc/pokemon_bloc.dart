import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_search/models/name_pokemon.dart';
import 'package:pokemon_search/repository/repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonApiClient pokemonApiClient;
  PokemonBloc({@required this.pokemonApiClient})
      : assert(pokemonApiClient != null),
        super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(
    PokemonEvent event,
  ) async* {
    if (event is PokemonRequestedName) {
      yield PokemonLoadInProgress();
      try {
        final NamePokemon pokemon =
            await pokemonApiClient.getPokemonName(event.name);
        yield PokemonLoadSuccess(pokemon: pokemon);
      } catch (_) {
        yield PokemonLoadFailure();
      }
    }
  }
}
