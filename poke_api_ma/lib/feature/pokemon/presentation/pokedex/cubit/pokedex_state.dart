part of 'pokedex_cubit.dart';

enum PokedexStatus { initial, success, failure }

class PokedexState extends Equatable {
  const PokedexState({
    this.status = PokedexStatus.initial,
    this.pokemonList = const <Pokemon>[],
    this.hasReachedMax = false,
  });

  final PokedexStatus status;
  final List<Pokemon> pokemonList;
  final bool hasReachedMax;

  PokedexState copyWith({
    PokedexStatus? status,
    List<Pokemon>? pokemonList,
    bool? hasReachedMax,
  }) {
    return PokedexState(
      status: status ?? this.status,
      pokemonList: pokemonList ?? this.pokemonList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [
        status,
        pokemonList,
        hasReachedMax,
      ];
}
