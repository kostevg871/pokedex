import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_search/bloc/pokemon_bloc.dart';
import 'package:pokemon_search/bloc/random_pokemon_bloc.dart';
import 'package:pokemon_search/observer.dart';
import 'package:pokemon_search/repository/repository.dart';
import 'package:pokemon_search/screen/splash_screen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final PokemonApiClient pokemonApiClient =
      PokemonApiClient(httpClient: http.Client());
  runApp(App(pokemonApiClient: pokemonApiClient));
}

class App extends StatelessWidget {
  final PokemonApiClient pokemonApiClient;

  const App({Key key, this.pokemonApiClient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonBloc>(
      create: (context) => PokemonBloc(pokemonApiClient: pokemonApiClient),
      child: BlocProvider<RandomPokemonBloc>(
        create: (context) =>
            RandomPokemonBloc(pokemonApiClient: pokemonApiClient),
        child: MaterialApp(
            theme: ThemeData(
                primaryColor: Colors.yellow, accentColor: Colors.black),
            debugShowCheckedModeBanner: false,
            home: SplashScreen()),
      ),
    );
  }
}
