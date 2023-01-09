// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_other.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonOther _$PokemonOtherFromJson(Map<String, dynamic> json) => PokemonOther(
      dreamWorld: PokemonDreamWorld.fromJson(
          json['dream_world'] as Map<String, dynamic>),
      home: PokemonHome.fromJson(json['home'] as Map<String, dynamic>),
      officialArtwork: PokemonOfficialArtwork.fromJson(
          json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonOtherToJson(PokemonOther instance) =>
    <String, dynamic>{
      'dream_world': instance.dreamWorld.toJson(),
      'home': instance.home.toJson(),
      'official-artwork': instance.officialArtwork.toJson(),
    };
