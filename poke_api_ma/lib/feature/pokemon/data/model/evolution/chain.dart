import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/evolution/evolution_detail.dart';

part 'chain.g.dart';

@JsonSerializable(explicitToJson: true)
class Chain extends Equatable {
  const Chain({
    required this.species,
    required this.evolvesTo,
    this.evolutionDetails,
    this.isBaby = false,
  });

  factory Chain.fromJson(Map<String, dynamic> json) => _$ChainFromJson(json);

  Map<String, dynamic> toJson() => _$ChainToJson(this);

  final NamedAPIResource species;

  @JsonKey(name: 'evolution_details')
  final List<EvolutionDetail>? evolutionDetails;

  @JsonKey(name: 'evolves_to')
  final List<Chain> evolvesTo;

  @JsonKey(name: 'is_baby')
  final bool isBaby;

  Chain copyWith({
    NamedAPIResource? species,
    List<EvolutionDetail>? evolutionDetails,
    List<Chain>? evolvesTo,
    bool? isBaby,
  }) =>
      Chain(
        species: species ?? this.species,
        evolutionDetails: evolutionDetails ?? this.evolutionDetails,
        evolvesTo: evolvesTo ?? this.evolvesTo,
        isBaby: isBaby ?? this.isBaby,
      );

  @override
  List<Object?> get props => [
        species,
        evolutionDetails,
        evolvesTo,
        isBaby,
      ];
}
