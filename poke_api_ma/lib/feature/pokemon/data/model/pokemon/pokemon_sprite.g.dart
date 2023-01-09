// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_sprite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSprite _$PokemonSpriteFromJson(Map<String, dynamic> json) =>
    PokemonSprite(
      frontDefault: json['front_default'] as String,
      other: PokemonOther.fromJson(json['other'] as Map<String, dynamic>),
      frontFemale: json['front_female'] as String?,
    );

Map<String, dynamic> _$PokemonSpriteToJson(PokemonSprite instance) =>
    <String, dynamic>{
      'front_female': instance.frontFemale,
      'front_default': instance.frontDefault,
      'other': instance.other.toJson(),
    };
