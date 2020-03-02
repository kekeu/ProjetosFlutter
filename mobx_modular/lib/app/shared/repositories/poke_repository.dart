import 'package:dio/dio.dart';
import 'package:mobx_modular/app/shared/models/pokemon_model.dart';

class PokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    var response = await dio.get('/pokemon');
    List<PokemonModel> list = [];
    for (var json in (response.data['results'] as List)) {
      PokemonModel pok = PokemonModel(name: json['name']);
      list.add(pok);
    }
    return list;
  }

}