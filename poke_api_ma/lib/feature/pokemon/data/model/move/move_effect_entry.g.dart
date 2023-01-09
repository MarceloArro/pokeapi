// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_effect_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveEffectEntry _$MoveEffectEntryFromJson(Map<String, dynamic> json) =>
    MoveEffectEntry(
      effect: json['effect'] as String?,
      shortEffect: json['short_effect'] as String?,
      language:
          NamedAPIResource.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveEffectEntryToJson(MoveEffectEntry instance) =>
    <String, dynamic>{
      'effect': instance.effect,
      'short_effect': instance.shortEffect,
      'language': instance.language.toJson(),
    };
