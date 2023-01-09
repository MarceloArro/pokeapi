import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon_ability.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon_move.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon_sprite.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon_stat.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon_type.dart';

part 'pokemon.g.dart';

@JsonSerializable(explicitToJson: true)
class Pokemon extends Equatable {
  const Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.moves,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  final int id;
  final String name;

  @JsonKey(name: 'base_experience')
  final int? baseExperience;

  final int height;
  final int weight;
  final List<PokemonAbility> abilities;
  final List<PokemonMove> moves;
  final NamedAPIResource species;
  final PokemonSprite sprites;
  final List<PokemonStat> stats;
  final List<PokemonType> types;

  Pokemon copyWith({
    int? id,
    String? name,
    int? baseExperience,
    int? height,
    int? weight,
    List<PokemonAbility>? abilities,
    List<PokemonMove>? moves,
    NamedAPIResource? species,
    PokemonSprite? sprites,
    List<PokemonStat>? stats,
    List<PokemonType>? types,
  }) =>
      Pokemon(
        id: id ?? this.id,
        name: name ?? this.name,
        baseExperience: baseExperience ?? this.baseExperience,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        abilities: abilities ?? this.abilities,
        moves: moves ?? this.moves,
        species: species ?? this.species,
        sprites: sprites ?? this.sprites,
        stats: stats ?? this.stats,
        types: types ?? this.types,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        baseExperience,
        height,
        weight,
        abilities,
        moves,
        species,
        sprites,
        stats,
        types,
      ];
}


//TODO: solucionar problema con pokemon
// la propiedad que esta dando problemas es:
// sprites con el siguiente error:
// type 'Null' is not a subtype of type 'Map<String, dynamic>' in type cast
