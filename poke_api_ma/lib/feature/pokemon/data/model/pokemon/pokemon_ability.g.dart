// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      ability:
          NamedAPIResource.fromJson(json['ability'] as Map<String, dynamic>),
      slot: json['slot'] as int?,
      isHidden: json['is_hidden'] as bool? ?? false,
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'ability': instance.ability.toJson(),
      'slot': instance.slot,
      'is_hidden': instance.isHidden,
    };
