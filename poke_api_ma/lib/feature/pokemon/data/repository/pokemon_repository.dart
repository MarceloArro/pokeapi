import 'package:poke_api_ma/core/constant/api_resource_constant.dart';
import 'package:poke_api_ma/core/util/url_id_util.dart';
import 'package:poke_api_ma/feature/pokemon/data/pokemon.dart';

class PokemonRepository {
  const PokemonRepository({
    required PokemonRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final PokemonRemoteDataSource _remoteDataSource;

  Future<List<Pokemon>> getPokemonList({
    required String offset,
    String? limit,
  }) async {
    final pokemonList = <Pokemon>[];

    final namedAPIResultList = await _remoteDataSource.resourceList(
      router: AppAPIResource.pokemons,
      offset: offset,
      limit: limit,
    );

    for (final namedAPIResult in namedAPIResultList.results) {
      final pokemon =
          await _remoteDataSource.pokemonDetails(name: namedAPIResult.name);
      if (pokemon != null) {
        pokemonList.add(pokemon);
      }
    }

    return pokemonList;
  }

  Future<Species> getPokemonSpecies({required String speciesName}) async {
    final species = await _remoteDataSource.pokemonSpecies(name: speciesName);

    return species;
  }

  Future<EvolutionChain> getPokemonEvolutionChain({
    required String evolutionChainUrl,
  }) async {
    final evolutionChainId = getIdByUrl(url: evolutionChainUrl);
    final species =
        await _remoteDataSource.pokemonChainEvolution(id: evolutionChainId);

    return species;
  }

  // Future<Move> _getPokemonMovement({
  //   required String movementName,
  // }) async {
  //   final movement =
  //       await _remoteDataSource.pokemonMoveDetails(id: movementName);

  //   return movement;
  // }

  Future<Move?> _getPokemonMovementLvlUp({
    required PokemonMove pokemonMove,
  }) async {
    for (final moveVersionGroup in pokemonMove.versionGroupDetails) {
      if (moveVersionGroup.versionGroup.name == 'diamond-pearl' &&
          moveVersionGroup.moveLearnMethod.name == 'level-up') {
        final move = await _remoteDataSource.pokemonMoveDetails(
          id: pokemonMove.move.name,
        );
        return move.copyWith(lvlUp: moveVersionGroup.levelLearnedAt);
      }
    }

    return null;
  }

  Future<List<Move>> getPokemonMovementLvlUpList({
    required List<PokemonMove> pokemonMoveList,
  }) async {
    final moveList = <Move>[];

    for (final pokemonMove in pokemonMoveList) {
      final move = await _getPokemonMovementLvlUp(pokemonMove: pokemonMove);

      if (move != null) {
        moveList.add(move);
      }
    }

    return moveList;
  }
}
