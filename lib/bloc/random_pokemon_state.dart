part of 'random_pokemon_bloc.dart';

@immutable
abstract class RandomState extends Equatable {
  const RandomState();

  @override
  List<Object> get props => [];
}

class RandomInitial extends RandomState {}

class RandomLoadInProgress extends RandomState {}

class RandomLoadSuccess extends RandomState {
  final NamePokemon pokemon;

  const RandomLoadSuccess({@required this.pokemon}) : assert(pokemon != null);

  @override
  List<Object> get props => [pokemon];
}

class RandomLoadFailure extends RandomState {}
