import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_search/bloc/pokemon_bloc.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    @required TextEditingController textController,
    @required FocusNode focusNode,
  })  : _textController = textController,
        _focusNode = focusNode;

  final TextEditingController _textController;
  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
              controller: _textController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 8.0, right: 8.0),
                labelText: 'Input name Pokemon',
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                hintText: 'Pikachu',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            final name = _textController.value.text;
            FocusScope.of(context).requestFocus(_focusNode);
            if (name != null) {
              BlocProvider.of<PokemonBloc>(context)
                  .add(PokemonRequestedName(name: name));
            }
          },
        )
      ],
    );
  }
}
