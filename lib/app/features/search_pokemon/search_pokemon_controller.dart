import 'package:ifma_project/app/features/search_pokemon/search_pokemon_repository.dart';

import 'search_pokemon_model.dart';

class SearchPokemonController {
  final SearchPokemonRepository repository;
  var name = '';
  SearchPokemonModel? pokemonModel;

  SearchPokemonController(this.repository);

  Future<void> searchPokemon() async {
    pokemonModel = await repository.searchPokemon(name);
  }
}
