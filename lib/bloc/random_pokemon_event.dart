part of 'random_pokemon_bloc.dart';

@immutable
abstract class RandomEvent extends Equatable {
  const RandomEvent();
}

class PokemonRequestedRandom extends RandomEvent {
  final int id;

  const PokemonRequestedRandom({@required this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}
