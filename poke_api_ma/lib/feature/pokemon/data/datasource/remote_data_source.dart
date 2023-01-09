import 'dart:convert';
import 'dart:developer';

import 'package:poke_api_ma/core/constant/api_resource_constant.dart';
import 'package:poke_api_ma/core/util/http_util.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource_list.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/evolution/evolution_chain.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/move/move.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/species/species.dart';

class PokemonRemoteDataSource {
  PokemonRemoteDataSource({
    required HttpUtils httpUtils,
  }) : _httpUtils = httpUtils;

  final HttpUtils _httpUtils;

  Future<NamedAPIResourceList> resourceList({
    required String router,
    String? offset,
    String? limit,
  }) async {
    try {
      final response = await _httpUtils.getHttpWithQueryParams(
        route: router,
        queryParameters: {
          'limit': limit ?? '10',
          'offset': offset ?? '0',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedString = jsonDecode(response.body) as Map<String, dynamic>;
        return NamedAPIResourceList.fromJson(decodedString);
      }

      throw Exception();
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<Pokemon?> pokemonDetails({required String name}) async {
    try {
      final response = await _httpUtils.getHttp(
        route: '${AppAPIResource.pokemons}/$name',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedString = jsonDecode(response.body) as Map<String, dynamic>;
        return Pokemon.fromJson(decodedString);
      }

      return null;
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<Species> pokemonSpecies({required String name}) async {
    try {
      final response = await _httpUtils.getHttp(
        route: '${AppAPIResource.pokemonSpecies}/$name',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedString = jsonDecode(response.body) as Map<String, dynamic>;
        return Species.fromJson(decodedString);
      }

      throw Exception();
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<EvolutionChain> pokemonChainEvolution({required String id}) async {
    try {
      final response = await _httpUtils.getHttp(
        route: '${AppAPIResource.evolutionChains}/$id',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedString = jsonDecode(response.body) as Map<String, dynamic>;
        return EvolutionChain.fromJson(decodedString);
      }

      throw Exception();
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<Move> pokemonMoveDetails({required String id}) async {
    try {
      final response = await _httpUtils.getHttp(
        route: '${AppAPIResource.moves}/$id',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedString = jsonDecode(response.body) as Map<String, dynamic>;
        return Move.fromJson(decodedString);
      }

      throw Exception();
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
