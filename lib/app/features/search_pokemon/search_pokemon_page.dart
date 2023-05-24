import 'package:flutter/material.dart';
import 'package:ifma_project/app/features/search_pokemon/search_pokemon_controller.dart';
import 'package:ifma_project/app/features/search_pokemon/search_pokemon_mapper.dart';
import 'package:ifma_project/app/features/search_pokemon/search_pokemon_repository.dart';
import 'package:uno/uno.dart';

class SearchPokemonPage extends StatefulWidget {
  const SearchPokemonPage({super.key});

  @override
  State<SearchPokemonPage> createState() => _SearchPokemonPageState();
}

class _SearchPokemonPageState extends State<SearchPokemonPage> {
  late SearchPokemonController controller;

  @override
  void initState() {
    super.initState();
    controller = SearchPokemonController(
      SearchPokemonRepository(
        Uno(baseURL: 'https://pokeapi.co/api/v2'),
        SearchPokemonMapper(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = controller.pokemonModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Pokemon'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (model != null) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Dados Básicos',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                ListTile(
                  title: Text('ID: ${model.id}'),
                  subtitle: Text('Name: ${model.name}'),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Habilidades',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.abilities.length,
                  itemBuilder: (context, index) {
                    return Text(model.abilities[index]);
                  },
                ),
                const SizedBox(height: 30)
              ],
              TextField(
                onChanged: (value) {
                  controller.name = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Digite o nome de um pokémon. Ex.: ditto',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await controller.searchPokemon();
                  setState(() {});
                },
                child: const Text('Pesquisar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
