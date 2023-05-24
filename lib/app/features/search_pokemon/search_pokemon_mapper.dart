import 'package:ifma_project/app/features/search_pokemon/search_pokemon_model.dart';

class SearchPokemonMapper {
  SearchPokemonModel fromJson(Map<String, dynamic> json) {
    final id = json['id'].toString();

    final species = json['species'] as Map<String, dynamic>;

    final name = species['name'] as String;

    var abilities = <String>[];

    final abilityList = json['abilities'] as List<dynamic>;

    abilities = abilityList.map((e) => e['ability']['name'] as String).toList();

    return SearchPokemonModel(id, name, abilities);
  }
}
