part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class PokemonRequestedName extends PokemonEvent {
  final String name;

  const PokemonRequestedName({@required this.name}) : assert(name != null);

  @override
  List<Object> get props => [name];
}
