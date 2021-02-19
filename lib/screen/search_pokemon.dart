import 'package:flutter/material.dart';
import 'package:pokemon_search/widget/home_page_widget/pokemon_image.dart';
import 'package:pokemon_search/widget/home_page_widget/search_bar.dart';

class SearchPokemon extends StatefulWidget {
  @override
  _SearchPokemonState createState() => _SearchPokemonState();
}

class _SearchPokemonState extends State<SearchPokemon> {
  final TextEditingController _textController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Pokemon"),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(textController: _textController, focusNode: _focusNode),
              ImagePokemon(),
            ],
          ),
        ],
      ),
    );
  }
}
