import 'package:ifma_project/app/features/search_pokemon/search_pokemon_mapper.dart';
import 'package:ifma_project/app/features/search_pokemon/search_pokemon_model.dart';
import 'package:uno/uno.dart';

class SearchPokemonRepository {
  final Uno httpClient;
  final SearchPokemonMapper mapper;

  const SearchPokemonRepository(this.httpClient, this.mapper);

  Future<SearchPokemonModel> searchPokemon(String name) async {
    final result = await httpClient.get('/pokemon/$name');
    return mapper.fromJson(result.data);
  }
}
