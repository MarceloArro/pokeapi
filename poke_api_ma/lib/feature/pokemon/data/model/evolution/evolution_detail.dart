import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';

part 'evolution_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class EvolutionDetail extends Equatable {
  const EvolutionDetail({
    this.item,
    required this.trigger,
    this.gender,
    this.heldItem,
    this.knownMove,
    this.knownMoveType,
    this.location,
    this.minLevel,
    this.minHappiness,
    this.minBeauty,
    this.minAffection,
    this.needsOverworldRain,
    this.partySpecies,
    this.partyType,
    this.relativePhysicalStats,
    this.timeOfDay,
    this.tradeSpecies,
    this.turnUpsideDown,
  });

  factory EvolutionDetail.fromJson(Map<String, dynamic> json) =>
      _$EvolutionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionDetailToJson(this);

  final NamedAPIResource? item;

  final NamedAPIResource trigger;

  final int? gender;

  @JsonKey(name: 'held_item')
  final NamedAPIResource? heldItem;

  @JsonKey(name: 'known_move')
  final NamedAPIResource? knownMove;

  @JsonKey(name: 'known_move_type')
  final NamedAPIResource? knownMoveType;
  final NamedAPIResource? location;

  @JsonKey(name: 'min_level')
  final int? minLevel;

  @JsonKey(name: 'min_happiness')
  final int? minHappiness;

  @JsonKey(name: 'min_beauty')
  final int? minBeauty;

  @JsonKey(name: 'min_affection')
  final int? minAffection;

  @JsonKey(name: 'needs_overworld_rain')
  final bool? needsOverworldRain;

  @JsonKey(name: 'party_species')
  final NamedAPIResource? partySpecies;

  @JsonKey(name: 'party_type')
  final NamedAPIResource? partyType;

  @JsonKey(name: 'relative_physical_stats')
  final int? relativePhysicalStats;

  @JsonKey(name: 'time_of_day')
  final String? timeOfDay;

  @JsonKey(name: 'trade_species')
  final NamedAPIResource? tradeSpecies;

  @JsonKey(name: 'turn_upside_down')
  final bool? turnUpsideDown;

  EvolutionDetail copyWith({
    NamedAPIResource? item,
    NamedAPIResource? trigger,
    int? gender,
    NamedAPIResource? heldItem,
    NamedAPIResource? knownMove,
    NamedAPIResource? knownMoveType,
    NamedAPIResource? location,
    int? minLevel,
    int? minHappiness,
    int? minBeauty,
    int? minAffection,
    bool? needsOverworldRain,
    NamedAPIResource? partySpecies,
    NamedAPIResource? partyType,
    int? relativePhysicalStats,
    String? timeOfDay,
    NamedAPIResource? tradeSpecies,
    bool? turnUpsideDown,
  }) =>
      EvolutionDetail(
        item: item ?? this.item,
        trigger: trigger ?? this.trigger,
        gender: gender ?? this.gender,
        heldItem: heldItem ?? this.heldItem,
        knownMove: knownMove ?? this.knownMove,
        knownMoveType: knownMoveType ?? this.knownMoveType,
        location: location ?? this.location,
        minLevel: minLevel ?? this.minLevel,
        minHappiness: minHappiness ?? this.minHappiness,
        minBeauty: minBeauty ?? this.minBeauty,
        minAffection: minAffection ?? this.minAffection,
        needsOverworldRain: needsOverworldRain ?? this.needsOverworldRain,
        partySpecies: partySpecies ?? this.partySpecies,
        partyType: partyType ?? this.partyType,
        relativePhysicalStats:
            relativePhysicalStats ?? this.relativePhysicalStats,
        timeOfDay: timeOfDay ?? this.timeOfDay,
        tradeSpecies: tradeSpecies ?? this.tradeSpecies,
        turnUpsideDown: turnUpsideDown ?? this.turnUpsideDown,
      );

  @override
  List<Object?> get props => [
        item,
        trigger,
        gender,
        heldItem,
        knownMove,
        knownMoveType,
        location,
        minLevel,
        minHappiness,
        minBeauty,
        minAffection,
        needsOverworldRain,
        partySpecies,
        partyType,
        relativePhysicalStats,
        timeOfDay,
        tradeSpecies,
        turnUpsideDown
      ];
}
