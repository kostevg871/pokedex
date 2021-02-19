part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonLoadSuccess extends PokemonState {
  final NamePokemon pokemon;

  const PokemonLoadSuccess({@required this.pokemon}) : assert(pokemon != null);

  @override
  List<Object> get props => [pokemon];
}

class PokemonLoadFailure extends PokemonState {}
