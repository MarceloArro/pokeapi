import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/api_resource.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/flavor_text.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/species/species_genus.dart';
part 'species.g.dart';

@JsonSerializable(explicitToJson: true)
class Species extends Equatable {
  const Species({
    required this.id,
    required this.name,
    required this.genderRate,
    required this.evolutionChain,
    required this.generation,
    required this.flavorTextEntries,
    required this.genera,
    this.order,
    this.captureRate,
  });

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);

  final int id;

  final String name;

  final int? order;

  @JsonKey(name: 'gender_rate')
  final int genderRate;

  @JsonKey(name: 'capture_rate')
  final int? captureRate;

  @JsonKey(name: 'evolution_chain')
  final APIResource evolutionChain;

  final NamedAPIResource generation;

  @JsonKey(name: 'flavor_text_entries')
  final List<FlavorText> flavorTextEntries;

  final List<SpeciesGenus> genera;

  Species copyWith({
    int? id,
    String? name,
    int? order,
    int? genderRate,
    int? captureRate,
    APIResource? evolutionChain,
    NamedAPIResource? generation,
    List<FlavorText>? flavorTextEntries,
    List<SpeciesGenus>? genera,
  }) =>
      Species(
        id: id ?? this.id,
        name: name ?? this.name,
        order: order ?? this.order,
        genderRate: genderRate ?? this.genderRate,
        captureRate: captureRate ?? this.captureRate,
        evolutionChain: evolutionChain ?? this.evolutionChain,
        generation: generation ?? this.generation,
        flavorTextEntries: flavorTextEntries ?? this.flavorTextEntries,
        genera: genera ?? this.genera,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        order,
        genderRate,
        captureRate,
        evolutionChain,
        generation,
        flavorTextEntries,
        genera,
      ];
}
