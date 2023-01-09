import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_api_ma/feature/pokemon/data/pokemon.dart';

part 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit({
    required this.pokemonRepository,
  }) : super(const PokemonDetailState());

  final PokemonRepository pokemonRepository;

  Future<void> getPokemonData({required Pokemon pokemon}) async {
    try {
      emit(
        state.copyWith(
          status: PokemonStatus.loading,
          pokemon: pokemon,
        ),
      );

      final pokemonMoveList =
          await pokemonRepository.getPokemonMovementLvlUpList(
        pokemonMoveList: pokemon.moves,
      );

      pokemonMoveList.sort((a, b) => a.lvlUp!.compareTo(b.lvlUp!));

      final pokemonSpecies = await pokemonRepository.getPokemonSpecies(
        speciesName: pokemon.name,
      );

      final pokemonEvolutionChain =
          await pokemonRepository.getPokemonEvolutionChain(
        evolutionChainUrl: pokemonSpecies.evolutionChain.url,
      );

      emit(
        state.copyWith(
          status: PokemonStatus.success,
          pokemon: pokemon,
          pokemonSpecies: pokemonSpecies,
          pokemonEvolutionChain: pokemonEvolutionChain,
          pokemonMovement: pokemonMoveList,
        ),
      );

      // final pokemonList = <Pokemon>[];
      // pokemonEvolutionChain.chain.evolvesTo[0].evolvesTo[0].evolvesTo[0].evolvesTo[];
      // final chain;
      // if
      // getPokemon(pokemonEvolutionChain.chain);
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: PokemonStatus.failure));
    }
  }

  void getPokemon(Chain chain) {
    if (chain.evolvesTo.isEmpty) return;

    for (final evolution in chain.evolvesTo) {
      //Obtener pokemon
      log(evolution.species.name);
    }
  }
}
