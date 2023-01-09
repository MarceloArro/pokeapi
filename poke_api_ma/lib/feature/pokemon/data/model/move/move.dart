import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/move/move_effect_entry.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/move/move_flavor_text_entry.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/move/move_meta.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/move/move_name.dart';

part 'move.g.dart';

@JsonSerializable(explicitToJson: true)
class Move extends Equatable {
  const Move({
    required this.id,
    required this.name,
    this.accuracy,
    this.effectChance,
    required this.pp,
    required this.priority,
    this.power,
    required this.damageClass,
    required this.effectEntries,
    required this.meta,
    required this.names,
    required this.type,
    required this.flavorTextEntries,
    this.lvlUp,
  });

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);
  final int id;
  final String name;
  final int? accuracy;
  final int? effectChance;
  final int pp;
  final int priority;
  final int? power;
  final int? lvlUp;

  @JsonKey(name: 'damage_class')
  final NamedAPIResource damageClass;

  @JsonKey(name: 'effect_entries')
  final List<MoveEffectEntry>? effectEntries;

  final MoveMeta meta;
  final List<MoveName> names;
  final NamedAPIResource type;
  @JsonKey(name: 'flavor_text_entries')
  final List<MoveFlavorTextEntry> flavorTextEntries;

  Move copyWith({
    int? id,
    String? name,
    int? accuracy,
    int? effectChance,
    int? pp,
    int? priority,
    int? power,
    NamedAPIResource? damageClass,
    List<MoveEffectEntry>? effectEntries,
    MoveMeta? meta,
    List<MoveName>? names,
    NamedAPIResource? type,
    List<MoveFlavorTextEntry>? flavorTextEntries,
    int? lvlUp,
  }) =>
      Move(
        id: id ?? this.id,
        name: name ?? this.name,
        accuracy: accuracy ?? this.accuracy,
        effectChance: effectChance ?? this.effectChance,
        pp: pp ?? this.pp,
        priority: priority ?? this.priority,
        power: power ?? this.power,
        damageClass: damageClass ?? this.damageClass,
        effectEntries: effectEntries ?? this.effectEntries,
        meta: meta ?? this.meta,
        names: names ?? this.names,
        type: type ?? this.type,
        flavorTextEntries: flavorTextEntries ?? this.flavorTextEntries,
        lvlUp: lvlUp ?? this.lvlUp,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        accuracy,
        effectChance,
        pp,
        priority,
        power,
        damageClass,
        effectEntries,
        meta,
        names,
        type,
        flavorTextEntries,
        lvlUp
      ];
}
