import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_api_ma/feature/pokemon/data/pokemon.dart';

part 'pokedex_state.dart';

class PokedexCubit extends Cubit<PokedexState> {
  PokedexCubit({
    required this.pokemonRepository,
  }) : super(const PokedexState());

  final PokemonRepository pokemonRepository;
  int offset = 0;

  Future<void> pokemonFetched() async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PokedexStatus.initial) {
        final pokemonList = await pokemonRepository.getPokemonList(
          offset: offset.toString(),
          limit: 12.toString(),
        );
        offset += 12;
        return emit(
          state.copyWith(
            status: PokedexStatus.success,
            pokemonList: pokemonList,
            hasReachedMax: false,
          ),
        );
      }

      final pokemonList = await pokemonRepository.getPokemonList(
        offset: offset.toString(),
        limit: 30.toString(),
      );
      offset += 30;
      pokemonList.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PokedexStatus.success,
                pokemonList: List.of(state.pokemonList)..addAll(pokemonList),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: PokedexStatus.failure));
    }
  }
}
