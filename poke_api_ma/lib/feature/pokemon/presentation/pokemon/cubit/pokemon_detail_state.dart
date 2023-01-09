part of 'pokemon_detail_cubit.dart';

enum PokemonStatus { initial, loading, success, failure }

class PokemonDetailState extends Equatable {
  const PokemonDetailState({
    this.status = PokemonStatus.initial,
    this.pokemon,
    this.pokemonEvolutionChain,
    this.pokemonSpecies,
    this.pokemonMovement = const [],
    this.evolutionChainPokemon = const [],
  });

  final PokemonStatus status;
  final Pokemon? pokemon;
  final EvolutionChain? pokemonEvolutionChain;
  final Species? pokemonSpecies;
  final List<Move> pokemonMovement;
  final List<Pokemon> evolutionChainPokemon;

  PokemonDetailState copyWith({
    PokemonStatus? status,
    Pokemon? pokemon,
    bool? hasReachedMax,
    EvolutionChain? pokemonEvolutionChain,
    Species? pokemonSpecies,
    List<Move>? pokemonMovement,
    List<Pokemon>? evolutionChainPokemon,
  }) {
    return PokemonDetailState(
      status: status ?? this.status,
      pokemon: pokemon ?? this.pokemon,
      pokemonEvolutionChain:
          pokemonEvolutionChain ?? this.pokemonEvolutionChain,
      pokemonSpecies: pokemonSpecies ?? this.pokemonSpecies,
      pokemonMovement: pokemonMovement ?? this.pokemonMovement,
      evolutionChainPokemon:
          evolutionChainPokemon ?? this.evolutionChainPokemon,
    );
  }

  @override
  List<Object?> get props => [
        status,
        pokemon,
        pokemonEvolutionChain,
        pokemonSpecies,
        pokemonMovement,
        evolutionChainPokemon,
      ];
}
