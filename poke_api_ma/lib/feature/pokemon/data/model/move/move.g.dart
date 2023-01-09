// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Move _$MoveFromJson(Map<String, dynamic> json) => Move(
      id: json['id'] as int,
      name: json['name'] as String,
      accuracy: json['accuracy'] as int?,
      effectChance: json['effectChance'] as int?,
      pp: json['pp'] as int,
      priority: json['priority'] as int,
      power: json['power'] as int?,
      damageClass: NamedAPIResource.fromJson(
          json['damage_class'] as Map<String, dynamic>),
      effectEntries: (json['effect_entries'] as List<dynamic>?)
          ?.map((e) => MoveEffectEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MoveMeta.fromJson(json['meta'] as Map<String, dynamic>),
      names: (json['names'] as List<dynamic>)
          .map((e) => MoveName.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: NamedAPIResource.fromJson(json['type'] as Map<String, dynamic>),
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => MoveFlavorTextEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      lvlUp: json['lvlUp'] as int?,
    );

Map<String, dynamic> _$MoveToJson(Move instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'accuracy': instance.accuracy,
      'effectChance': instance.effectChance,
      'pp': instance.pp,
      'priority': instance.priority,
      'power': instance.power,
      'damage_class': instance.damageClass.toJson(),
      'effect_entries': instance.effectEntries?.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
      'names': instance.names.map((e) => e.toJson()).toList(),
      'type': instance.type.toJson(),
      'flavor_text_entries':
          instance.flavorTextEntries.map((e) => e.toJson()).toList(),
      'lvlUp': instance.lvlUp,
    };
