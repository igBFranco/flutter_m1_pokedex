import 'dart:async';
import 'package:http/http.dart' as http;

class PokeAPI {
  //fazendo a requisição de dados da API para o app 
  static Future<http.Response> getPokemon() =>
      http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=250"));

  static Future<http.Response> getType() =>
      http.get(Uri.parse("https://pokeapi.co/api/v2/type"));

  static Future<http.Response> getAbility() =>
      http.get(Uri.parse("https://pokeapi.co/api/v2/ability?limit=327"));

  static Future<http.Response> getMove() =>
      http.get(Uri.parse("https://pokeapi.co/api/v2/move?limit=844"));

  static Future<http.Response> getItem() =>
      http.get(Uri.parse("https://pokeapi.co/api/v2/item?limit=1607"));
}
